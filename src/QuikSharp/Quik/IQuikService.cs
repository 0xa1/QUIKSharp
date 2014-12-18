namespace QuikSharp.Quik {
    /// <summary>
    /// Implements all Quik callback functions to be processed 
    /// </summary>
    public interface IQuikService : IDuplexClientService<IQuikCallback> {
        /// <summary>
        /// ������� ���������� ���������� QUIK ����� ������� ������� main(). � �������� ��������� ��������� �������� ������� ���� � ������������ �������. 
        /// ����������: � ������ ������� ������������ ����� ����������� ���������������� ��� ����������� ���������� � ���������� ����� �������� ��������� ������ main()
        /// </summary>
        /// <param name="scriptPath"></param>
        void OnInit(string scriptPath);

        /// <summary>
        /// ������� ���������� ���������� QUIK ��� ��������� ������� �� ������� ����������. 
        /// ����������: �������� ��������� �stop_flag� � �1�.����� ��������� ���������� ������� ������� ���������� ������ ������� 5 ������. �� ��������� ����� ��������� ������� main() ����������� �������������. ��� ���� �������� ������ ��������� ��������.
        /// </summary>
        /// <param name="stopFlag"></param>
        void OnStop(int stopFlag);

    }
}