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
    /// Логика взаимодействия для AdminWindow.xaml
    /// </summary>
    public partial class AdminWindow : Window
    {
        public AdminWindow()
        {
            InitializeComponent();
            LoadUser();
        }

        private void LoadUser()
        {
            lb_Login.Content = UserService.CurrentUser.Login;
            var role = DBConnection.connection.Role.Where(x => x.Role_ID == UserService.CurrentUser.Role_ID).FirstOrDefault();
            lb_Role.Content = role.Role_Name;
        }

        private void btn_Exit_Click(object sender, RoutedEventArgs e)
        {
            MainWindow win = new MainWindow();
            win.Show();
            this.Close();
        }

        private void btn_EmployeeList_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Находится в разработке :)");
        }

        private void btn_CreateUser_Click(object sender, RoutedEventArgs e)
        {
            UserCreateWindow win = new UserCreateWindow();
            win.Show();
            this.Close();
        }

        private void btn_CreateAnimal_Click(object sender, RoutedEventArgs e)
        {
            AnimalCreateWindow win = new AnimalCreateWindow();
            win.Show();
            this.Close();
        }
    }
}
