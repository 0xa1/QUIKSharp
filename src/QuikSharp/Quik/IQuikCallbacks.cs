using System;
using System.ComponentModel;

namespace QuikSharp.Quik {

    // TODO Redirect these callbacks to events or rather do with events from the beginning

    /// <summary>
    /// Implements all Quik callback functions to be processed on .NET side.
    /// These functions are called by Quik inside QLUA.
    /// 
    /// ������� ��������� ������
    /// ������� ���������� ��� ��������� ��������� ������ ��� ������� ���������� QUIK �� �������: 
    /// main - ���������� ��������� ������ ���������� � ������� 
    /// OnAccountBalance - ��������� ������� �� ����� 
    /// OnAccountPosition - ��������� ������� �� ����� 
    /// OnAllTrade - ����� ������������ ������ 
    /// OnCleanUp - ����� �������� ������ � ��� �������� ����� qlua.dll 
    /// OnClose - �������� ��������� QUIK 
    /// OnConnected - ������������ ����� � �������� QUIK 
    /// OnDepoLimit - ��������� ��������� ������ 
    /// OnDepoLimitDelete - �������� ��������� ������ 
    /// OnDisconnected - ���������� �� ������� QUIK 
    /// OnFirm - �������� ����� ����� 
    /// OnFuturesClientHolding - ��������� ������� �� �������� ����� 
    /// OnFuturesLimitChange - ��������� ����������� �� �������� ����� 
    /// OnFuturesLimitDelete - �������� ������ �� �������� ����� 
    /// OnInit - ������������� ������� main 
    /// OnMoneyLimit - ��������� ��������� ������ 
    /// OnMoneyLimitDelete - �������� ��������� ������ 
    /// OnNegDeal - ����� ������ �� ����������� ������ 
    /// OnNegTrade - ����� ������ ��� ���������� 
    /// OnOrder - ����� ������ ��� ��������� ���������� ������������ ������ 
    /// OnParam - ��������� ������� ���������� 
    /// OnQuote - ��������� ������� ��������� 
    /// OnStop - ��������� ������� �� ������� ���������� 
    /// OnStopOrder - ����� ����-������ ��� ��������� ���������� ������������ ����-������ 
    /// OnTrade - ����� ������ 
    /// OnTransReply - ����� �� ���������� 
    /// </summary>
    [Obsolete]
    internal interface IQuikCallbacks {
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