import gb.UserPasswordEncoderListener
import gb.GBUserDetailsService
// Place your Spring DSL code here
beans = {
    userPasswordEncoderListener(UserPasswordEncoderListener)
    userDetailsService(GBUserDetailsService)
}


