package gb

/**
 * Questo controller gestisce le impostazioni utente. Queste pagine dovrebero richiedere il login aggiuntivo in caso
 * di accesso tramite cookie. Inoltre dovrebbe essere inviata una mail che avvisa della modifica.
 *
 *
 * 1) Consente aun utente generico di diventare 'supplier', in prima battuta non viene definto alcun processo di
 * autorizzazione
 *
 * 2) Consente al 'supplier' di modificare i propri dati di spedizione
 *
 * 3) Consente al supplier di modificare la propria pagina vetrina
 *
 * 4) Cambio password, viene mandata una mail di notifica
 *
 *
 */
class SettingsController {

    def index() { }

    def activateSupplier() {
        roleService

    }

    def updateAddress() {

    }

    def updatePage() {

    }

    def updatePassword() {

    }

}
