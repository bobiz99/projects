<main>
    <?php
    require_once 'heroArea.php';
    ?>
    <!-- Latest Products Start -->
    <section class="popular-items latest-padding">
        <div class="container">
            <div class="row product-btn justify-content-between mb-40">
                <div class="properties__button">
                    <!--Nav Button  -->
                    <nav>
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                            <a class="nav-item nav-link" id="btnPrikazSve" href="" name="noviProizvodi">All Products</a>
                            <a class="nav-item nav-link" id="btnPrikaziNove" href="" name="noviProizvodi">NewestArrivals</a>
                            <a class="nav-item nav-link" id="btnPriceHighLow" href="" name="cenaViseNize"> Price high to low</a>
                            <a class="nav-item nav-link" id="btnPriceLowHigh" href="" name="cenaNizeVise"> Price low to high</a>
                        </div>
                    </nav>
                    <!--End Nav Button  -->
                </div>
                <!-- Grid and List view -->
                <div class="grid-list-view">
                </div>
                <!-- Select items -->
                <div class="select-this">
                    <form action="#">
                        <div class="select-itms">
                            <select name="select" id="select1">
                                <option value="">40 per page</option>
                                <option value="">50 per page</option>
                                <option value="">60 per page</option>
                                <option value="">70 per page</option>
                            </select>
                        </div>
                    </form>
                </div>
            </div>
            <!-- Nav Card -->
            <div class="tab-content" id="nav-tabContent">
                <!-- card one -->
                <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                    <div class="row" id="shopProducts">
                        <!-- Dinamicki ispis -->
                        <?php include "logic/getProducts.php" ?>
                    </div>
                </div>
            </div>
            <!-- End Nav Card -->
        </div>
    </section>
</main>