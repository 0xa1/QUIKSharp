using System.Collections.Generic;
using System.Threading.Tasks;
using QuikSharp.DataStructures;

namespace QuikSharp
{
    /// <summary>
    /// ������� ��� ��������� ������
    /// </summary>
    public class CandleFunctions
    {

        /// <summary>
        /// </summary>
        public QuikService QuikService { get; private set; }

        /// <summary>
        /// </summary>
        public delegate void CandleHandler(Candle candle);
        /// <summary>
        /// ������� ��������� ����� �����. ��� ������������ ���������� ����������� � ������� ������ Subscribe.
        /// </summary>
        public event CandleHandler NewCandle;
        internal void RaiseNewCandleEvent(Candle candle)
        {
            if (NewCandle != null)
                NewCandle(candle);
        }

        /// <summary>
        /// </summary>
        public CandleFunctions(int port) { QuikService = QuikService.Create(port); }


        /// <summary>
        /// ������� ������������� ��� ��������� ���������� � ������� �� �������������� (����� ������ ��� ���������� ������� ������ �� ������������, ������� ��� ��������� ������� ������ ������ ������ ���� ������). ������������ ��� ��������� ������.
        /// </summary>
        /// <param name="graphicTag">��������� ������������� ������� ��� ����������</param>
        /// <returns></returns>
        public async Task<List<Candle>> GetAllCandles(string graphicTag)
        {
            return await GetCandles(graphicTag, 0, 0, 0).ConfigureAwait(false);
        }

        /// <summary>
        /// ������� ������������� ��� ��������� ���������� � ������� �� �������������� (����� ������ ��� ���������� ������� ������ �� ������������, ������� ��� ��������� ������� ������ ������ ������ ���� ������).   
        /// </summary>
        /// <param name="graphicTag">��������� ������������� ������� ��� ����������</param>
        /// <param name="line">����� ����� ������� ��� ����������. ������ ����� ����� ����� 0</param>
        /// <param name="first">������ ������ ������. ������ (����� �����) ������ ����� ������ 0</param>
        /// <param name="count">���������� ������������� ������</param>
        /// <returns></returns>
        public async Task<List<Candle>> GetCandles(string graphicTag, int line, int first, int count)
        {
            var message = new Message<string>(graphicTag + "|" + line + "|" + first + "|" + count, "get_candles");
            Message<List<Candle>> response = await QuikService.Send<Message<List<Candle>>>(message).ConfigureAwait(false);
            return response.Data;
        }

        /// <summary>
        /// ������� ���������� ������ ������ ���������� ����������� ��������� ���������.
        /// </summary>
        /// <param name="classCode">����� �����������.</param>
        /// <param name="securityCode">��� �����������.</param>
        /// <param name="interval">�������� ������.</param>
        /// <returns>������ ������.</returns>
        public async Task<List<Candle>> GetAllCandles(string classCode, string securityCode, CandleInterval interval)
        {
            //�������� count == 0 ������ � ���, ��� ������������ ��� ��������� �����
            return await GetLastCandles(classCode, securityCode, interval, 0).ConfigureAwait(false);
        }

        /// <summary>
        /// ���������� �������� ���������� ������ ���������� ����������� � ��������� � �����.
        /// </summary>
        /// <param name="classCode">����� �����������.</param>
        /// <param name="securityCode">��� �����������.</param>
        /// <param name="interval">�������� ������.</param>
        /// <param name="count">���������� ������������ ������ � �����.</param>
        /// <returns>������ ������.</returns>
        public async Task<List<Candle>> GetLastCandles(string classCode, string securityCode, CandleInterval interval, int count)
        {
            var message = new Message<string>(classCode + "|" + securityCode + "|" + (int)interval + "|" + count, "get_candles_from_data_source");
            Message<List<Candle>> response = await QuikService.Send<Message<List<Candle>>>(message).ConfigureAwait(false);
            return response.Data;
        }

        /// <summary>
        /// ������������ �������� �� ��������� ������������ ������ (�����).
        /// </summary>
        /// <param name="classCode">����� �����������.</param>
        /// <param name="securityCode">��� �����������.</param>
        /// <param name="interval">�������� ������.</param>
        public async Task Subscribe(string classCode, string securityCode, CandleInterval interval)
        {
            var message = new Message<string>(classCode + "|" + securityCode + "|" + (int)interval, "subscribe_to_candles");
            await QuikService.Send<Message<string>>(message).ConfigureAwait(false);
        }

        /// <summary>
        /// ������������ �� ��������� ������������ ������ (������).
        /// </summary>
        /// <param name="classCode">����� �����������.</param>
        /// <param name="securityCode">��� �����������.</param>
        /// <param name="interval">�������� ������.</param>
        public async Task Unsubscribe(string classCode, string securityCode, CandleInterval interval)
        {
            var message = new Message<string>(classCode + "|" + securityCode + "|" + (int)interval, "unsubscribe_from_candles");
            await QuikService.Send<Message<string>>(message).ConfigureAwait(false);
        }

        /// <summary>
        /// �������� ��������� �������� �� ������������ ������ (�����).
        /// </summary>
        /// <param name="classCode">����� �����������.</param>
        /// <param name="securityCode">��� �����������.</param>
        /// <param name="interval">�������� ������.</param>
        public async Task<bool> IsSubscribed(string classCode, string securityCode, CandleInterval interval)
        {
            var message = new Message<string>(classCode + "|" + securityCode + "|" + (int)interval, "is_subscribed");
            Message<bool> response = await QuikService.Send<Message<bool>>(message).ConfigureAwait(false);
            return response.Data;
        }
    }
}
