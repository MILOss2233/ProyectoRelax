<header class="header"> 
    <div class="logo">🛏️ RELAX HOGAR</div>

    <nav>
        <a href="Index.php">Inicio</a>
        <a href="Index.php?vista=deseos">Lista de Deseos</a>
    </nav>
    <?php if(isset($_SESSION["usuario"])):?>
    <div class="nav-session">
        <span>👤<?php echo
        $_SESSION["usuario"];?></span>
        <a href="PROGRAMA/logout.php">Cerrar Sesion</a>
    </div>
    <?php else: ?>
        <div>
            <a href="html/login.html">Login</a>
            <a href="html/registro.html">Registro</a>
        </div>
        <?php endif;?>
</header>