// Copyright (C) 2014 Victor Baybekov

using System;

namespace QuikSharp {

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
    public interface IQuikEvents {
        event EventHandler Stop;
        event EventHandler OnAccountBalance;
        event EventHandler OnAccountPosition;
        event EventHandler OnAllTrade;
        event EventHandler OnCleanUp;
        /// <summary>
        /// ������� ���������� ����� ��������� ��������� QUIK. 
        /// </summary>
        event OnCloseHandler OnClose;
        event EventHandler OnConnected;
        event EventHandler OnDepoLimit;
        event EventHandler OnDepoLimitDelete;
        event EventHandler OnDisconnected;
        event EventHandler OnFirm;
        event EventHandler OnFuturesClientHolding;
        event EventHandler OnFuturesLimitChange;
        event EventHandler OnFuturesLimitDelete;
        /// <summary>
        /// ������� ���������� ���������� QUIK ����� ������� ������� main(). � �������� ��������� ��������� �������� ������� ���� � ������������ �������. 
        /// ����������: � ������ ������� ������������ ����� ����������� ���������������� ��� ����������� ���������� � ���������� ����� �������� ��������� ������ main()
        /// </summary>
        event OnInitHandler OnInit;
        event EventHandler OnMoneyLimit;
        event EventHandler OnMoneyLimitDelete;
        event EventHandler OnNegDeal;
        event EventHandler OnNegTrade;
        event EventHandler OnOrder;
        event EventHandler OnParam;
        event EventHandler OnQuote;
        /// <summary>
        /// ������� ���������� ���������� QUIK ��� ��������� ������� �� ������� ����������. 
        /// ����������: �������� ��������� �stop_flag� � �1�.����� ��������� ���������� ������� ������� ���������� ������ ������� 5 ������. �� ��������� ����� ��������� ������� main() ����������� �������������. ��� ���� �������� ������ ��������� ��������.
        /// </summary>
        event OnStopHandler OnStop;
        event EventHandler OnStopOrder;
        event EventHandler OnTrade;
        event EventHandler OnTransReply;

    }
}