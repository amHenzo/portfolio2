<template>
    <div class="uptrack-app">
        <!-- Banner -->
        <header class="banner">
        </header>

        <!-- Description -->
        <section class="description">
            <h2>À propos de l'application</h2>
            <p>
                Uptrack permet aux passionnés de sports extrêmes en montagne (parapente, canyoning, rafting, wingsuit, ski, snowboard, VTT, escalade, ultratrail) de suivre leurs statistiques et leurs accomplissements après chaque session. Consultez les classements hebdomadaires, mensuels et all time, comparez-vous à vos amis ou à tous les utilisateurs, et découvrez les performances par sport et par lieu.
            </p>
        </section>

        <section>
            <h2>tester l'appli ?</h2>
            <p>
                Vous pouvez tester l'application en vous rendant sur le lien ci-dessous. bien sur ce n'est pas la version finale, mais vous pourrez vous faire une idée de l'application et de ses fonctionnalités.
            </p>
            <div class="test-link-container">
                <a href="https://lenisorel77-18237.bubbleapps.io/version-test/leaderboard" target="_blank" class="test-link-btn">
                    cliquez ici !
                </a>

            </div>
        </section>

        <!-- Screenshots Section -->
        <section class="screenshots">
            <h2>Captures d'écran</h2>
            <div class="screenshots-list">
                <img src="./Screenshot1.png" alt="Screenshot 1" />
                <img src="./Screenshot2.png" alt="Screenshot 2" />
                <img src="./Screenshot3.png" alt="Screenshot 3" />
            </div>
        </section>

        <!-- Contact Link -->
        <section class="contact">
            <router-link to="/contactme" class="contact-link">
                Nous contacter
            </router-link>
        </section>
    </div>
</template>

<script setup>

</script>

<style scoped>
.uptrack-app {
    font-family: 'Segoe UI', Arial, sans-serif;
    max-width: 1000px;
    margin: 0 auto;
    padding: 24px;
    background: #f7f9fa;
    border-radius: 16px;
    box-shadow: 0 2px 12px rgba(0,0,0,0.08);
    color: #333;
    margin-top: -30px;
}

.banner {
    text-align: center;
    /* Ajout de la bannière en fond */
    background: url('./uptrack_banner.png') no-repeat center center / cover;
    color: #1a1717;
    padding: 80px 16px 24px 16px;
    border-radius: 12px;
    margin-bottom: 32px;
    position: relative;
    min-height: 250px;
    /* Supprime l'ancien background logo si présent */
}

.logo {
    width: 200px;
    height: 200px;
    margin-bottom: 12px;
    position: relative;
    z-index: 1;
}

.banner .logo {
    margin-bottom: 0;
    margin-top: -40px;
}

.banner h1 {
    display: none;
}

.screenshots {
    margin-bottom: 32px;
}

.screenshots-list {
    display: flex;
    gap: 16px;
    justify-content: center;
    flex-wrap: wrap;
    margin-top: 12px;
}

.screenshots-list img {
    width: 180px;
    height: 360px;
    object-fit: cover;
    border-radius: 8px;
    box-shadow: 0 1px 6px rgba(0,0,0,0.12);
    background: #eaeaea;
}

.description {
    margin-bottom: 32px;
}

.contact {
    text-align: center;
}

.contact-link {
    display: inline-block;
    background: #3a7bd5;
    color: #0c0b0b;
    padding: 12px 32px;
    border-radius: 24px;
    text-decoration: none;
    font-weight: bold;
    transition: background 0.2s;
}

.contact-link:hover {
    background: #005fa3;
}

/* Nouveau style pour le bouton test et les logos */
.test-link-container {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 18px;
    margin: 24px 0 32px 0;
}

.test-link-btn {
    display: inline-block;
    background: #3a7bd5;
    color: #0c0b0b;
    padding: 12px 32px;
    border-radius: 24px;
    text-decoration: none;
    font-weight: bold;
    font-size: 1.2em;
    transition: background 0.2s;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
}

.test-link-btn:hover {
    background: #005fa3;
    color: #fff;
}

.test-logo {
    width: 48px;
    height: 48px;
    object-fit: contain;
}
</style>