Admin.create!({
                name: 'Admin',
                email: 'admin@admin.com',
                password: '1',
                password_confirmation: '1'
})

Station.create!([{
                   name: 'Lisbon',
                   phone: '+9925238353',
                   address: 'Vasco da Gama str.25',
                   info: 'Station in the city center',
                   store_info: 'For every taste'
                 },
                 {
                   name: 'Porto',
                   phone: '+9935612946',
                   address: 'Colondal str.142/2',
                   info: 'Station near the airport',
                   store_info: 'For every taste'
}])
