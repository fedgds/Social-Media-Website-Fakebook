<?php

namespace App\Http\Controllers;

use App\Http\Resources\GroupResource;
use App\Http\Resources\PostResource;
use App\Models\Group;
use App\Models\Post;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Illuminate\Support\Facades\Auth;

class HomeController extends Controller
{
    public function index(Request $request) 
    {   
        $userId = Auth::id();
        $posts = Post::query()
            ->withCount('reactions')
            ->with([
                'comments' => function ($query) use ($userId) {
                    $query->withCount('reactions');
                },
                'reactions' => function ($query) use ($userId) {
                    $query->where('user_id', $userId);
            }])
            ->latest()
            ->paginate(5);

        $post = PostResource::collection($posts);
        if($request->wantsJson()) {
            return $posts;
        }

        $group = Group::query()
            ->select(['groups.*','gu.status', 'gu.role'])
            ->join('group_users AS gu', 'gu.group_id', 'groups.id')
            ->where('gu.user_id', Auth::id())
            ->orderBy('gu.role')
            ->orderBy('name', 'desc')
            ->latest()
            ->get();
            
        return Inertia::render('Home', [
            'posts' => $post,
            'groups' => GroupResource::collection($group)
        ]);
    }
}
