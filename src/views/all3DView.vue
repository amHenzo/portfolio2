<script setup>
import Tile3D from '../components/Tile3D.vue'
</script>

<template>
    <div>
        <div class="tile">
            
            <Tile3D :stlFileName="'cache_ampoules_v2.stl'"></Tile3D>
            <div class="comments">
                <h3>cache_ampoules_v2</h3>
                <div>
                    prelude 3g first gen light bulb trunk cover
                </div>
            </div>
        </div>
        <div class="tile">
            <Tile3D :stlFileName="'golemdor2024.stl'"></Tile3D>
            <div class="comments">
                <h3>golemdor2024</h3>
                <div>
                    did some tweaking for printing this model for an organization
                </div>
            </div>
        </div>
        <div class="tile">
            <Tile3D :stlFileName="'prise_allume_cigare.stl'"></Tile3D>
            <div class="comments">
                <h3>prise_allume_cigare</h3>
                <div>
                    prelude 3g first 12v plub to reblace rear wiper
                </div>
            </div>
            
        </div>
        <div class="tile">
            <Tile3D :stlFileName="'attachement_fleche.stl'"></Tile3D>
            <div class="comments">
                <h3>attachement_fleche</h3>
                <div>
                    attachement used on a pneumatic arrow launching device can be found  
                    <a href="https://www.thingiverse.com/thing:4583092" target="_blank" rel="noopener">here </a>
                </div>
            </div>
            
        </div>
    </div>
</template>

<script>
</script>
<style scoped>

template div{
    align-self: center;
}

.tile :nth-child(1){
    flex:8;
}

.tile{
    display: flex;
    align-items: stretch;

    padding: 10px;

}
.comments{
    flex:2;
    padding: 10px;


}
@media screen and (max-width: 1024px) {

    .tile{
        display: flex;
        flex-direction: column;
        padding: 10px;
    }

}
</style>