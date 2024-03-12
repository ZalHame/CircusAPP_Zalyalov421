using CircusAPP.Data;
using CircusAPP.Windows;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace CircusAPP
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void btn_SignIn_Click(object sender, RoutedEventArgs e)
        {
            if (tb_Login != null && tb_Password != null)
            {
                var login = DBConnection.connection.User.Where(x => x.Login == tb_Login.Text).FirstOrDefault();
                if (login != null && login.Password == tb_Password.Password)
                {
                    UserService.CurrentUser = login;
                    if (login.Role_ID == 1)
                    {
                        AdminWindow win = new AdminWindow();
                        win.Show();
                    }
                    else if (login.Role_ID == 2)
                    {
                        ArtistWindow win = new ArtistWindow();
                        win.Show();
                    }
                    else if (login.Role_ID == 3)
                    {
                        AnimalTrainerWindow win = new AnimalTrainerWindow();
                        win.Show();
                    }
                    this.Close();
                }

                else
                {
                    MessageBox.Show("Неверный логин или пароль!");
                }
            }
        }
    }
}
