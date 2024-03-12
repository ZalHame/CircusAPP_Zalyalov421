using CircusAPP.ADO;
using CircusAPP.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
    /// Логика взаимодействия для AnimalCreateWindow.xaml
    /// </summary>
    public partial class AnimalCreateWindow : Window
    {
        public AnimalCreateWindow()
        {
            InitializeComponent();
            LoadGenders();
            LoadAnimalTrainers();
        }

        private void tb_Age_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!IsTextNumeric(e.Text))
                e.Handled = true;
        }

        private void tb_Height_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (!IsTextNumeric(e.Text))
                e.Handled = true;
        }

        private bool IsTextNumeric(string text)
        {
            Regex regex = new Regex("[^0-9]+");
            return !regex.IsMatch(text);
        }

        private void btn_CreateAnimal_Click(object sender, RoutedEventArgs e)
        {
            if (tb_Name.Text != null && !string.IsNullOrEmpty(tb_Name.Text) || tb_Age.Text != null && !string.IsNullOrEmpty(tb_Age.Text) ||
                cb_Gender.Text != null && !string.IsNullOrEmpty(cb_Gender.Text) || tb_Height.Text != null && !string.IsNullOrEmpty(tb_Height.Text) ||
                cb_AnimalTrainer.Text != null && !string.IsNullOrEmpty(cb_AnimalTrainer.Text))
            {
                var gender = DBConnection.connection.Gender.Where(x => x.Gender_Name == cb_Gender.Text).FirstOrDefault();
                var animalTrainer = DBConnection.connection.User.Where(x => x.Login == cb_AnimalTrainer.Text).FirstOrDefault();
                Animal newAnimal = new Animal()
                {
                    Animal_Name = tb_Name.Text,
                    Animal_Age = int.Parse(tb_Age.Text),
                    Gender_ID = gender.Gender_ID,
                    Animal_Height = decimal.Parse(tb_Height.Text),
                    Recommend_Food = tb_RecomFood.Text,
                    Care = tb_Care.Text,
                    User_ID = animalTrainer.User_ID,
                };
                DBConnection.connection.Animal.Add(newAnimal);
                DBConnection.connection.SaveChanges();
                MessageBox.Show($"Новое животное добавлено!");

                AdminWindow win = new AdminWindow();
                win.Show();
                this.Close();
            }
            else
            {
                MessageBox.Show("Заполните все поля!");
            }
        }

        private void LoadGenders()
        {
            foreach (var item in DBConnection.connection.Gender.ToList())
            {
                cb_Gender.Items.Add(item.Gender_Name);
            }
        }

        private void LoadAnimalTrainers()
        {
            foreach (var item in DBConnection.connection.User.ToList())
            {
                if (item.Role_ID == 3)
                {
                    cb_AnimalTrainer.Items.Add(item.Login);
                }
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
