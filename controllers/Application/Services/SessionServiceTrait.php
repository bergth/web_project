<?php

namespace Application\Services;

trait SessionServiceTrait
{

    protected $crudUsers;

    /**
     * @return mixed
     */
    public function getCrudUsers()
    {
        return $this->crudUsers;
    }

    /**
     * @param mixed $crudUsers
     */
    public function setCrudUsers($crudUsers)
    {
        $this->crudUsers = $crudUsers;
    }
}
