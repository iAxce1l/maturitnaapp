import SwiftUI

struct KontaktView: View {
    @State private var isAdresaExpanded: Bool = false
    @State private var isVseobecneExpanded: Bool = false
    @State private var isStarostkaExpanded: Bool = false
    @State private var isKontrolorExpanded: Bool = false
    @State private var isPrednostaExpanded: Bool = false
    @State private var isSekretariatExpanded = false
    @State private var isVeducaZSSExpanded = false
    @State private var isFinancneOddelenieExpanded = false
    @State private var isVystavbaOddelenieExpanded = false
    @State private var isSkolstvoExpanded = false
    @State private var isEvidenciaExpanded = false
    @State private var isOpatrovatelskaExpanded = false
    @State private var isTerenniExpanded = false
    @State private var isKomunitniExpanded = false
    @State private var isKniznicaExpanded = false
    @State private var isObecnaPoliciaExpanded = false
    @State private var isTechnickaPrevadzkaExpanded = false
    
    var body: some View {
        NavigationView {
        ScrollView {
            
            VStack(alignment: .leading, spacing: 20) {
                DisclosureGroup(
                    isExpanded: $isAdresaExpanded,
                    content: {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("OBEC SMÍŽANY")
                                .font(.headline)
                                .fontWeight(.semibold)
                            Text("NÁM. M. PAJDUŠÁKA 1341/50")
                            Text("053 11 SMÍŽANY")
                        }
                        .padding()
                        .background(Color(UIColor.secondarySystemBackground))
                        .cornerRadius(10)
                        
                        // Odkaz na mapy
                        Link(destination: URL(string: "http://maps.apple.com/?address=Nám.+M.+Pajdušáka+1341/50,Smižany,05311,Slovakia")!) {
                            HStack {
                                Image(systemName: "map.fill")
                                    .foregroundColor(.blue)
                                Text("Otvoriť v Mapách")
                                    .foregroundColor(.blue)
                                    .font(.body)
                                    .underline()
                            }
                            .padding(.top, 5)
                        }
                    },
                    label: {
                        SectionHeader(title: "Korešpondenčná adresa")
                    }
                )

                // MARK: - Všeobecné kontakty
                DisclosureGroup(
                                    isExpanded: $isVseobecneExpanded, // Rozbalenie sekcie
                                    content: {
                                        VStack(alignment: .leading, spacing: 5) {
                                            ContactRow(title: "Tel.", value: "053/443 14 83", link: "tel:0534431483", icon: "phone.fill")
                                            ContactRow(title: "E-mail", value: "smizany@smizany.sk", link: "mailto:smizany@smizany.sk", icon: "envelope.fill")
                                            ContactRow(title: "Webmaster", value: "webmaster@smizany.sk", link: "mailto:webmaster@smizany.sk", icon: "globe")
                                        }
                                    },
                                    label: {
                                        SectionHeader(title: "Základné všeobecné kontakty")
                                    }
                                )
                                
                                Divider()

                // MARK: - Starostka
                DisclosureGroup(
                                    isExpanded: $isStarostkaExpanded, // Rozbalenie sekcie
                                    content: {
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text("Mgr. Miroslava Szitová, PhD.")
                                                .font(.headline)
                                                .fontWeight(.semibold)
                                            ContactRow(title: "Tel.", value: "053/443 14 83, kl. 202", link: "tel:0534431483", icon: "phone.fill")
                                            ContactRow(title: "E-mail", value: "miroslava.szitova@smizany.sk", link: "mailto:miroslava.szitova@smizany.sk", icon: "envelope.fill")
                                        }
                                    },
                                    label: {
                                        SectionHeader(title: "Starostka")
                                    }
                                )
                                
                                Divider()
                
                // MARK: - Hlavný kontrolór
                DisclosureGroup(
                    isExpanded: $isKontrolorExpanded, // Rozbalenie sekcie
                    content: {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Ing. Patrícia Mareková")
                                .font(.headline)
                                .fontWeight(.semibold)
                            ContactRow(title: "Tel.", value: "053/443 14 83, kl. 219", link: "tel:0534431483", icon: "phone.fill")
                            ContactRow(title: "E-mail", value: "kontrolor@smizany.sk", link: "mailto:kontrolor@smizany.sk", icon: "envelope.fill")
                        }
                    },
                    label: {
                        SectionHeader(title: "Hlavný kontrolór")
                    }
                )
                
                Divider()
                // MARK: - Prednosta
                DisclosureGroup(
                     isExpanded: $isPrednostaExpanded, // Rozbalenie sekcie
                     content: {
                         VStack(alignment: .leading, spacing: 5) {
                             Text("Miroslav Grečko")
                                 .font(.headline)
                                 .fontWeight(.semibold)
                             ContactRow(title: "Tel.", value: "053/443 14 83, kl. 203", link: "tel:0534431483", icon: "phone.fill")
                             ContactRow(title: "Tel.", value: "0915 885 410", link: "tel:0915885410", icon: "phone.fill")
                             ContactRow(title: "E-mail", value: "prednosta@smizany.sk", link: "mailto:prednosta@smizany.sk", icon: "envelope.fill")
                         }
                     },
                     label: {
                         SectionHeader(title: "Prednosta")
                     }
                 )
                 
                 Divider()

                // MARK: - Sekretariát
                DisclosureGroup(
                                    isExpanded: $isSekretariatExpanded,
                                    content: {
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text("Mária Mangerová")
                                                .font(.headline)
                                                .fontWeight(.semibold)
                                            ContactRow(title: "Tel.", value: "053/443 14 83", link: "tel:0534431483", icon: "phone.fill")
                                            ContactRow(title: "E-mail", value: "podatelna@smizany.sk", link: "mailto:podatelna@smizany.sk", icon: "envelope.fill")
                                            ContactRow(title: "E-mail", value: "info@smizany.sk", link: "mailto:info@smizany.sk", icon: "envelope.fill")
                                        }
                                    },
                                    label: {
                                        SectionHeader(title: "Sekretariát")
                                    }
                                )
                                
                                Divider()

                // MARK: - Vedúca ZSS Smižany
                DisclosureGroup(
                                   isExpanded: $isVeducaZSSExpanded,
                                   content: {
                                       VStack(alignment: .leading, spacing: 5) {
                                           Text("PhDr. Magdaléna Pekarčíková")
                                               .font(.headline)
                                               .fontWeight(.semibold)
                                           ContactRow(title: "Tel.", value: "0907 863 620", link: "tel:0907863620", icon: "phone.fill")
                                           ContactRow(title: "E-mail", value: "riaditel.smizany@gmail.com", link: "mailto:riaditel.smizany@gmail.com", icon: "envelope.fill")
                                       }
                                   },
                                   label: {
                                       SectionHeader(title: "Vedúca ZSS Smižany")
                                   }
                               )
                               
                               Divider()
                // MARK: - Oddelenie finančné a správy daní
                DisclosureGroup(
                                    isExpanded: $isFinancneOddelenieExpanded,
                                    content: {
                                        VStack(alignment: .leading, spacing: 20) {
                                            // Ing. Lucia Vitkovská
                                            VStack(alignment: .leading, spacing: 5) {
                                                Text("Ing. Lucia Vitkovská - vedúca oddelenia")
                                                    .font(.headline)
                                                    .fontWeight(.semibold)
                                                ContactRow(title: "Tel.", value: "053/443 14 83, kl. 209", link: "tel:0534431483", icon: "phone.fill")
                                                ContactRow(title: "E-mail", value: "ekonom@smizany.sk", link: "mailto:ekonom@smizany.sk", icon: "envelope.fill")
                                            }
                                            Divider()

                                            // Mgr. Daniela Valigurská
                                            VStack(alignment: .leading, spacing: 5) {
                                                Text("Mgr. Daniela Valigurská - referentka personalistiky a miezd")
                                                    .font(.headline)
                                                    .fontWeight(.semibold)
                                                ContactRow(title: "Tel.", value: "053/443 14 83, kl. 212", link: "tel:0534431483", icon: "phone.fill")
                                                ContactRow(title: "E-mail", value: "pam@smizany.sk", link: "mailto:pam@smizany.sk", icon: "envelope.fill")
                                            }
                                            Divider()

                                            // Mgr. Mária Morihladková
                                            VStack(alignment: .leading, spacing: 5) {
                                                Text("Mgr. Mária Morihladková - referentka daní a vymáhania pohľadávok")
                                                    .font(.headline)
                                                    .fontWeight(.semibold)
                                                ContactRow(title: "Tel.", value: "053/443 14 83, kl. 208", link: "tel:0534431483", icon: "phone.fill")
                                                ContactRow(title: "E-mail", value: "dane@smizany.sk", link: "mailto:dane@smizany.sk", icon: "envelope.fill")
                                            }
                                            Divider()

                                            // Mgr. Marta Hasajová
                                            VStack(alignment: .leading, spacing: 5) {
                                                Text("Mgr. Marta Hasajová - referentka správy daní")
                                                    .font(.headline)
                                                    .fontWeight(.semibold)
                                                ContactRow(title: "Tel.", value: "053/443 14 83, kl. 210", link: "tel:0534431483", icon: "phone.fill")
                                                ContactRow(title: "E-mail", value: "poplatky@smizany.sk", link: "mailto:poplatky@smizany.sk", icon: "envelope.fill")
                                            }
                                            Divider()

                                            // Ľubica Kacvinská
                                            VStack(alignment: .leading, spacing: 5) {
                                                Text("Ľubica Kacvinská - referentka personalistiky a miezd, hlavná pokladňa")
                                                    .font(.headline)
                                                    .fontWeight(.semibold)
                                                ContactRow(title: "Tel.", value: "053/443 14 83, kl. 212", link: "tel:0534431483", icon: "phone.fill")
                                                ContactRow(title: "E-mail", value: "pokladna@smizany.sk", link: "mailto:pokladna@smizany.sk", icon: "envelope.fill")
                                            }
                                            Divider()

                                            // Bc. Anna Čujová
                                            VStack(alignment: .leading, spacing: 5) {
                                                Text("Bc. Anna Čujová - pokladňa")
                                                    .font(.headline)
                                                    .fontWeight(.semibold)
                                                ContactRow(title: "Tel.", value: "053/443 14 83, kl. 207", link: "tel:0534431483", icon: "phone.fill")
                                                ContactRow(title: "E-mail", value: "podnikatelska.uctaren@smizany.sk", link: "mailto:podnikatelska.uctaren@smizany.sk", icon: "envelope.fill")
                                            }
                                            Divider()

                                            // Mgr. Valéria Novotná
                                            VStack(alignment: .leading, spacing: 5) {
                                                Text("Mgr. Valéria Novotná - referent účtovníctva a evidencie majetku obce")
                                                    .font(.headline)
                                                    .fontWeight(.semibold)
                                                ContactRow(title: "Tel.", value: "053/443 14 83, kl. 209", link: "tel:0534431483", icon: "phone.fill")
                                                ContactRow(title: "E-mail", value: "uctaren@smizany.sk", link: "mailto:uctaren@smizany.sk", icon: "envelope.fill")
                                            }
                                        }
                                    },
                                    label: {
                                        SectionHeader(title: "Oddelenie finančné a správy daní")
                                    }
                                )
                                Divider()
                
                // MARK: - Oddelenie výstavby a životného prostredia
                DisclosureGroup(
                    isExpanded: $isVystavbaOddelenieExpanded,
                            content: {
                                VStack(alignment: .leading, spacing: 20) {
                                    
                                    // Ing. Beata Lukačová
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("Ing. Beata Lukačová - vedúca oddelenia")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                        ContactRow(title: "Tel.", value: "053/443 14 83, kl. 204", link: "tel:0534431483", icon: "phone.fill")
                                        ContactRow(title: "Tel.", value: "0907 903 735", link: "tel:0907903735", icon: "phone.fill")
                                        ContactRow(title: "E-mail", value: "beata.lukacova@smizany.sk", link: "mailto:beata.lukacova@smizany.sk", icon: "envelope.fill")
                                    }
                                    
                                    Divider()
                                    
                                    // Ing. Katarína Rišová
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("Ing. Katarína Rišová - referentka stavebného úradu")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                        ContactRow(title: "Tel.", value: "053/443 14 83, kl. 216", link: "tel:0534431483", icon: "phone.fill")
                                        ContactRow(title: "E-mail", value: "katarina.risova@smizany.sk", link: "mailto:katarina.risova@smizany.sk", icon: "envelope.fill")
                                    }
                                    
                                    Divider()
                                    
                                    // Ing. Michal Čmel
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("Ing. Michal Čmel - referent stavebného úradu")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                        ContactRow(title: "Tel.", value: "053/443 14 83, kl. 215", link: "tel:0534431483", icon: "phone.fill")
                                    }
                                    
                                    Divider()
                                    
                                    // Mgr. Lucia Čujová
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("Mgr. Lucia Čujová - referentka stavebného úradu")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                        ContactRow(title: "Tel.", value: "053/443 14 83, kl. 221", link: "tel:0534431483", icon: "phone.fill")
                                        ContactRow(title: "E-mail", value: "lucia.cujova@smizany.dcom.sk", link: "mailto:lucia.cujova@smizany.dcom.sk", icon: "envelope.fill")
                                    }
                                    
                                    Divider()
                                    
                                    // Ing. Matúš Gonda
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("Ing. Matúš Gonda - referent stavebného úradu")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                        ContactRow(title: "Tel.", value: "053/443 14 83, kl. 215", link: "tel:0534431483", icon: "phone.fill")
                                        ContactRow(title: "E-mail", value: "stavby.gonda@gmail.com", link: "mailto:stavby.gonda@gmail.com", icon: "envelope.fill")
                                    }
                                    
                                    Divider()
                                    
                                    // Mgr. Stanislav Beregházy
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("Mgr. Stanislav Beregházy - referent životného prostredia a dopravy")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                        ContactRow(title: "Tel.", value: "053/443 14 83, kl. 206", link: "tel:0534431483", icon: "phone.fill")
                                        ContactRow(title: "Tel.", value: "0908 982 722", link: "tel:0908982722", icon: "phone.fill")
                                        ContactRow(title: "E-mail", value: "stanislav.bereghazy@smizany.sk", link: "mailto:stanislav.bereghazy@smizany.sk", icon: "envelope.fill")
                                    }
                                    
                                    Divider()
                                    
                                    // Ing. Ondrej Beregházy
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text("Ing. Ondrej Beregházy - referent majetku obce, bytového a odpadového hospodárstva")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                        ContactRow(title: "Tel.", value: "053/443 14 83, kl. 222", link: "tel:0534431483", icon: "phone.fill")
                                        ContactRow(title: "Tel.", value: "0918 623 264", link: "tel:0918623264", icon: "phone.fill")
                                        ContactRow(title: "E-mail", value: "ondrej.bereghazy@smizany.sk", link: "mailto:ondrej.bereghazy@smizany.sk", icon: "envelope.fill")
                                    }
                                }
                            },
                            label: {
                                SectionHeader(title: "Oddelenie výstavby a životného prostredia")
                            }
                        )
                Divider()

                // MARK: - Oddelenie školstva a Spoločný školský úrad
                DisclosureGroup(
                    isExpanded: $isSkolstvoExpanded,
                    content: {
                        VStack(alignment: .leading, spacing: 20) {
                            
                            // Mgr. Marcela Bilpuchová
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Mgr. Marcela Bilpuchová - odborný zamestnanec školského úradu")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                ContactRow(title: "Tel.", value: "053/443 14 83, kl. 214", link: "tel:0534431483", icon: "phone.fill")
                                ContactRow(title: "E-mail", value: "skolsky.urad@smizany.sk", link: "mailto:skolsky.urad@smizany.sk", icon: "envelope.fill")
                                ContactRow(title: "E-mail", value: "marcela.bilpuchova@smizany.sk", link: "mailto:marcela.bilpuchova@smizany.sk", icon: "envelope.fill")
                            }
                            
                            Divider()
                            
                            // PaedDr. Andrea Baluchová
                            VStack(alignment: .leading, spacing: 5) {
                                Text("PaedDr. Andrea Baluchová - odborný zamestnanec školského úradu")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                ContactRow(title: "Tel.", value: "053/443 14 83, kl. 214", link: "tel:0534431483", icon: "phone.fill")
                                ContactRow(title: "E-mail", value: "skolsky.urad@smizany.sk", link: "mailto:skolsky.urad@smizany.sk", icon: "envelope.fill")
                                ContactRow(title: "E-mail", value: "andrea.baluchova@smizany.sk", link: "mailto:andrea.baluchova@smizany.sk", icon: "envelope.fill")
                            }
                        }
                    },
                    label: {
                        SectionHeader(title: "Oddelenie školstva a Spoločný školský úrad")
                    }
                )

                Divider()

                // MARK: - Oddelenie evidencie obyvateľstva a sociálnych vecí
                DisclosureGroup(
                    isExpanded: $isEvidenciaExpanded,
                    content: {
                        VStack(alignment: .leading, spacing: 20) {
                            
                            // Mgr. Dušana Melegová
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Mgr. Dušana Melegová - vedúca oddelenia")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                ContactRow(title: "Tel.", value: "053/443 14 83, kl. 220", link: "tel:0534431483", icon: "phone.fill")
                                ContactRow(title: "Tel.", value: "0907 903 736", link: "tel:0907903736", icon: "phone.fill")
                                ContactRow(title: "E-mail", value: "evidencia@smizany.sk", link: "mailto:evidencia@smizany.sk", icon: "envelope.fill")
                            }
                            
                            Divider()
                            
                            // Mgr. Simona Máziková
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Mgr. Simona Máziková - referent evidencie obyvateľstva")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                ContactRow(title: "Tel.", value: "053/443 14 83, kl. 220", link: "tel:0534431483", icon: "phone.fill")
                                ContactRow(title: "E-mail", value: "simona.mazikova@smizany.sk", link: "mailto:simona.mazikova@smizany.sk", icon: "envelope.fill")
                            }
                        }
                    },
                    label: {
                        SectionHeader(title: "Oddelenie evidencie obyvateľstva a sociálnych vecí")
                    }
                )

                Divider()

                
                // MARK: - Opatrovateľská služba
                DisclosureGroup(
                    isExpanded: $isOpatrovatelskaExpanded,
                    content: {
                        VStack(alignment: .leading, spacing: 20) {
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("""
                                Mária Feherová, Marta Tomečková, Elena Novotná, Zlatica Hojnošová, Slávka Štiffelová, Marta Tarbajová,
                                Janka Čikovská, Magdaléna Balázová, Mária Kupčová, Zlatica Opremčáková, Helena Regecová, Beáta
                                Ancinová, Jarmila Kováčová, Mgr. Ľubomíra Chovancová, Ing. Tatiana Kleinová, Lucia Polovková, Hana
                                Kufčáková, Miroslava Vantroboá, Magdaléna Zajacová, Zuzana Balážová Šubová
                                """)
                                .font(.body)
                            }
                        }
                    },
                    label: {
                        SectionHeader(title: "Opatrovateľská služba")
                    }
                )
                Divider()

                // MARK: - Terénni sociálni pracovníci
                DisclosureGroup(
                    isExpanded: $isTerenniExpanded,
                    content: {
                        VStack(alignment: .leading, spacing: 20) {
                            
                            // Mgr. Emília Solárová
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Mgr. Emília Solárová - terénna sociálna pracovníčka")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                ContactRow(title: "Tel.", value: "0940 653 410", link: "tel:0940653410", icon: "phone.fill")
                            }
                            
                            Divider()
                            
                            // Ing. Mária Smreková
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Ing. Mária Smreková - terénna sociálna pracovníčka")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                            }
                            
                            Divider()
                            
                            // Mgr. Katarína Hovancová
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Mgr. Katarína Hovancová - terénna sociálna pracovníčka")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                            }
                        }
                    },
                    label: {
                        SectionHeader(title: "Terénni sociálni pracovníci")
                    }
                )

                Divider()

                // MARK: - Komunitní pracovníci
                DisclosureGroup(
                    isExpanded: $isKomunitniExpanded,
                    content: {
                        VStack(alignment: .leading, spacing: 20) {
                            
                            // Mgr. Anna Budzová
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Mgr. Anna Budzová - odborný garant KC")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                ContactRow(title: "Tel.", value: "0918 907 865", link: "tel:0918907865", icon: "phone.fill")
                            }
                            
                            Divider()
                            
                            // Mgr. Vanda Molnárová
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Mgr. Vanda Molnárová - odborný pracovník KC")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                            }
                            
                            Divider()
                            
                            // Zuzana Bartošová
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Zuzana Bartošová - pracovník KC")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                            }
                        }
                    },
                    label: {
                        SectionHeader(title: "Komunitní pracovníci")
                    }
                )

                Divider()

                // MARK: - Obecná knižnica
                DisclosureGroup(
                    isExpanded: $isKniznicaExpanded,
                    content: {
                        VStack(alignment: .leading, spacing: 20) {
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Nám. M. Pajdušáka 1341/50, 053 11 Smižany")
                                    .font(.subheadline)
                            }
                            .padding()
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(10)
                            
                            Link(destination: URL(string: "http://maps.apple.com/?address=Nám.+M.+Pajdušáka+1341/50,Smižany,05311,Slovakia")!) {
                                HStack {
                                    Image(systemName: "map.fill")
                                        .foregroundColor(.blue)
                                    Text("Otvoriť v Mapách")
                                        .foregroundColor(.blue)
                                        .font(.body)
                                        .underline()
                                }
                                .padding(.top, 5)
                            }
                            
                            Divider()
                            
                            // Anastázia Adamcová
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Anastázia Adamcová")
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                ContactRow(title: "Tel.", value: "053/443 14 83, kl. 211", link: "tel:0534431483", icon: "phone.fill")
                                ContactRow(title: "E-mail", value: "kniznica@smizany.sk", link: "mailto:kniznica@smizany.sk", icon: "envelope.fill")
                            }
                        }
                    },
                    label: {
                        SectionHeader(title: "Obecná knižnica")
                    }
                )

                Divider()


                // MARK: - Obecná polícia
                DisclosureGroup(
                    isExpanded: $isObecnaPoliciaExpanded,
                    content: {
                        VStack(alignment: .leading, spacing: 20) {
                            
                            // Radovan Frankovič
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Radovan Frankovič - náčelník obecnej polície, poverený zastupovaním")
                                    .font(.headline)
                                    .fontWeight(.bold)
                                ContactRow(title: "Tel. kontakt", value: "0908 930 159", link: "tel:0908930159", icon: "phone.fill")
                                ContactRow(title: "Tel. kontakt", value: "0907 939 916", link: "tel:0907939916", icon: "phone.fill")
                                ContactRow(title: "E-mail", value: "obecna.policia@smizany.sk", link: "mailto:obecna.policia@smizany.sk", icon: "envelope.fill")
                            }
                            
                            Divider()
                            
                            // Príslušníci obecnej polície
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Ján Leško - príslušník obecnej polície")
                                    .font(.body)
                                Text("JUDr. Valentín Vavrek - príslušník obecnej polície")
                                    .font(.body)
                                Text("Ján Galler, Marcel Kavulič - obsluha kamerového systému")
                                    .font(.body)
                            }
                            
                            Divider()
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Tatranská 80, 053 11 Smižany - budova kultúrneho domu - vchod B")
                                    .font(.subheadline)
                                Link(destination: URL(string: "http://maps.apple.com/?address=Tatranská+80,Smižany,05311,Slovakia")!) {
                                    HStack {
                                        Image(systemName: "map.fill")
                                            .foregroundColor(.blue)
                                        Text("Otvoriť v Mapách")
                                            .foregroundColor(.blue)
                                            .font(.body)
                                            .underline()
                                    }
                                    .padding(.top, 5)
                                }
                            }
                        }
                    },
                    label: {
                        SectionHeader(title: "Obecná polícia")
                    }
                )

                Divider()

                // MARK: - Technická prevádzka
                DisclosureGroup(
                    isExpanded: $isTechnickaPrevadzkaExpanded,
                    content: {
                        VStack(alignment: .leading, spacing: 20) {
                            
                            // Kolegovia
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Matej Klein - zriadene obce")
                                    .font(.body)
                                Text("Milan Smorada, Radovan Jochman - prevádzkový pracovník")
                                    .font(.body)
                                Text("Viera Kokyová - koordinátor aktivačných prác")
                                    .font(.body)
                                Text("Marián Koky - koordinátor aktivačných prác")
                                    .font(.body)
                                Text("Marcel Peták - koordinátor aktivačných prác")
                                    .font(.body)
                            }
                        }
                    },
                    label: {
                        SectionHeader(title: "Technická prevádzka")
                    }
                )

                Divider()

            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Kontakt")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .center)
                        }
                    }
        }
    }
}

// MARK: - Section Header View
struct SectionHeader: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.blue.opacity(0.8))
            .cornerRadius(10)
    }
}

// MARK: - Contact Row View
struct ContactRow: View {
    let title: String
    let value: String
    let link: String
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.primary)
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Link(destination: URL(string: link)!) {
                    Text(value)
                        .foregroundColor(.primary)
                        .underline()
                }
            }
            Spacer()
        }
        .padding(.vertical, 5)
    }
}



#Preview {
    MainContentView()
}
