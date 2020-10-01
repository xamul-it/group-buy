
                            <div v-if="groupItem" class="card-body group-pattern-1" :style="'background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url(/assets/theme/img/categories/category-'+groupItem.category.id+'.jpg) no-repeat center/cover;'">
                                <div class="wideget-user">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12">
                                            <div class="wideget-user-desc text-center">
                                                <!-- div class="wideget-user-img">
                                                    <img class="brround" src="/assets/images/faces/face.jpg" alt="img">
                                                </div -->
                                                <div class="user-wrap wideget-user-info">
                                                    <!-- v-once -->
                                                    <h4 v-if="groupItem" class="font-weight-semibold text-white">{{ groupItem.name }}</h4>
                                                    <!-- div class="wideget-user-rating">
                                                        <a href="#"><i class="fa fa-star text-warning"></i></a>
                                                        <a href="#"><i class="fa fa-star text-warning"></i></a>
                                                        <a href="#"><i class="fa fa-star text-warning"></i></a>
                                                        <a href="#"><i class="fa fa-star text-warning"></i></a>
                                                        <a href="#"><i class="fa fa-star-o text-warning mr-1"></i></a> <span class="text-white">5 (3876 Reviews)</span>
                                                    </div -->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 col-md-12 text-center">
                                            <div class="wideget-user-info ">
                                                <div class="wideget-user-icons mt-2">
                                                    <a href="#" class="facebook-bg mt-0" title="Facebook"><i class="fa fa-facebook fa-lg"></i></a>
                                                    <a href="#" class="twitter-bg" title="Twitter"><i class="fa fa-twitter fa-lg"></i></a>
                                                    <a href="#" class="google-bg" title="YouTube"><i class="fa fa-youtube fa-lg"></i></a>
                                                    <a href="#" class="linkedin-bg" title="LinkedIn"><i class="fa fa-linkedin fa-lg"></i></a>
                                                    <a href="#" class="instagram-bg" title="Instagram"><i class="fa fa-instagram fa-lg"></i></a>
                                                    <a href="#" class="whatsapp-bg" title="Whatsapp"><i class="fa fa-whatsapp fa-lg"></i></a>
                                                    <a href="#" class="skype-bg" title="Skype"><i class="fa fa-skype fa-lg"></i></a>
                                                    <a href="#" class="slack-bg" title="Slack"><i class="fa fa-slack fa-lg"></i></a>
                                                    <a href="#" class="snapchat-bg" title="Snapchat"><i class="text-dark fa fa-snapchat-ghost fa-lg"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>