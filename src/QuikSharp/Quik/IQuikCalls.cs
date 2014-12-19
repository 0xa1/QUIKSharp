namespace QuikSharp.Quik {
    /// <summary>
    /// .NET interface to QLUA API. Calling the members from .NET is the same as calling 
    /// them from QLUA inside QUIK
    /// </summary>
    public partial interface IQuikCalls {
        /// <summary>
        /// ������� ���������� ����, �� �������� ��������� ���� info.exe, ����������� ������ ������, ��� ������������ ��������� ����� (�\�). ��������, C:\QuikFront. 
        /// </summary>
        /// <returns></returns>
        string GetWorkingFolder();

        /// <summary>
        /// ������� ������������� ��� ����������� ��������� ����������� ����������� ����� � �������. ���������� �1�, ���� ���������� ����� ���������� � �0�, ���� �� ����������. 
        /// </summary>
        /// <returns></returns>
        bool IsConnected();

        /// <summary>
        /// ������� ���������� ����, �� �������� ��������� ����������� ������, ��� ������������ ��������� ����� (�\�). ��������, C:\QuikFront\Scripts 
        /// </summary>
        /// <returns></returns>
        string GetScriptPath();

        /// <summary>
        /// ������� ���������� �������� ���������� ��������������� ���� (����� ���� ����� / �������������� ����). 
        /// </summary>
        /// <param name="param"></param>
        /// <returns></returns>
        string GetInfoParam(InfoParams param);

        /// <summary>
        /// ������� ���������� ��������� � ��������� QUIK. ���������� �nil� ��� ������ ���������� ��� ��� ����������� ������ �� ������� ����������. � ��������� ������� ���������� �1�. 
        /// </summary>
        /// <param name="message"></param>
        /// <param name="iconType"></param>
        /// <returns></returns>
        bool Message(string message, NotificationType iconType);

    }
}