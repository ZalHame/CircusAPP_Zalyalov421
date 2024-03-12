using CircusAPP.ADO;
using CircusAPP.Data;
using System;
using System.Collections.Generic;
using System.Data;
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
    /// Логика взаимодействия для UserCreateWindow.xaml
    /// </summary>
    public partial class UserCreateWindow : Window
    {
        public UserCreateWindow()
        {
            InitializeComponent();
            LoadRoles();
        }

        private void btn_CreateUser_Click(object sender, RoutedEventArgs e)
        {
            if (tb_Login.Text != null && !string.IsNullOrEmpty(tb_Login.Text) || tb_Password.Password != null && !string.IsNullOrEmpty(tb_Password.Password) ||
                tb_FirstName.Text != null && !string.IsNullOrEmpty(tb_FirstName.Text) || tb_LastName.Text != null && !string.IsNullOrEmpty(tb_LastName.Text) || 
                cb_Role.Text != null && !string.IsNullOrEmpty(cb_Role.Text))
            {
                var oldUser = DBConnection.connection.User.Where(x => x.Login == tb_Login.Text).FirstOrDefault();
                if (oldUser == null)
                {
                    var role = DBConnection.connection.Role.Where(x => x.Role_Name == cb_Role.Text).FirstOrDefault();
                    User newUser = new User()
                    {
                        Login = tb_Login.Text,
                        Password = tb_Password.Password,
                        FirstName = tb_FirstName.Text,
                        LastName = tb_LastName.Text,
                        Role_ID = role.Role_ID,
                    };
                    DBConnection.connection.User.Add(newUser);
                    DBConnection.connection.SaveChanges();
                    MessageBox.Show($"Пользователь {tb_Login.Text} создан!");

                    AdminWindow win = new AdminWindow();
                    win.Show();
                    this.Close();
                }
                else
                {
                    MessageBox.Show($"Пользователь с логином {tb_Login.Text} уже присутствует в системе!");
                }
            } 
            else
            {
                MessageBox.Show("Заполните все поля!");
            }
        }

        private void LoadRoles()
        {
            foreach (var item in DBConnection.connection.Role.ToList())
            {
                cb_Role.Items.Add(item.Role_Name);
            }
        }

        private void btn_Back_Click(object sender, RoutedEventArgs e)
        {
            AdminWindow win = new AdminWindow();
            win.Show();
            this.Close();
        }
    }
}
