<?php

namespace App\Filament\Resources\PostResource\Pages;

use App\Filament\Widgets\PostResource;
use Filament\Resources\Pages\CreateRecord;

class CreatePost extends CreateRecord
{
    /**
     * The resource model.
     */
    protected static string $resource = PostResource::class;
}
