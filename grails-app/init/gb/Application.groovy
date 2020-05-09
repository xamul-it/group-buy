package gb

import grails.boot.GrailsApp
import grails.boot.config.GrailsAutoConfiguration
import org.springframework.boot.ApplicationArguments
import org.springframework.boot.ApplicationRunner
import grails.gorm.transactions.Transactional

import groovy.transform.CompileStatic

@CompileStatic
class Application extends GrailsAutoConfiguration  implements ApplicationRunner
    {
        static void main(String[] args) {
            GrailsApp.run(Application, args)
        }

        @Override
        @Transactional
        void run(ApplicationArguments args) throws Exception {
            /*def role = new gb.Role(authority: 'ROLE_ADMIN')
            gb.Role.saveAll(
                    role,
                    new gb.Role(authority: 'ROLE_CUSTOMER'),
                    new gb.Role(authority: 'ROLE_SUPPLIER')
            )
            def admin = new gb.User(name: 'Admin User',
                    username: 'admin@admin',
                    password:'admin',
                    enabled: true,
                    accountExpired: false,
                    accountLocked: false,
                    passwordExpired: false
            )
            if (admin.hasErrors()) {
                admin.errors.allErrors.each {
                    println it
                }
            }
            gb.User.saveAll(admin)

            gb.UserRole.saveAll( new UserRole(user: admin, role: role))

            gb.Group.saveAll()
*/


        }

    }
