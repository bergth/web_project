<?php

namespace Application\Models\Entity;

session_start();
session_obliterate();
header('Location: index_index.php');
exit;