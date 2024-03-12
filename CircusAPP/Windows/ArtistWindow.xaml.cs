using CircusAPP.Data;
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
using System.Windows.Shapes;

namespace CircusAPP.Windows
{
    /// <summary>
    /// Логика взаимодействия для ArtistWindow.xaml
    /// </summary>
    public partial class ArtistWindow : Window
    {
        public ArtistWindow()
        {
            InitializeComponent();
            LoadUser();
        }

        private void btn_Exit_Click(object sender, RoutedEventArgs e)
        {
            MainWindow win = new MainWindow();
            win.Show();
            this.Close();
        }

        private void btn_Schedule_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Еще в разработке :)");
        }

        private void btn_CreateAnimal_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Еще в разработке :)");
        }

        private void LoadUser()
        {
            lb_Login.Content = UserService.CurrentUser.Login;
            var role = DBConnection.connection.Role.Where(x => x.Role_ID == UserService.CurrentUser.Role_ID).FirstOrDefault();
            lb_Role.Content = role.Role_Name;
        }
    }
}
