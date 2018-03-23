Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4077L76ZkhzF1Wm
 for <openbmc@lists.ozlabs.org>; Sat, 24 Mar 2018 02:50:55 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2NFoOqk056166
 for <openbmc@lists.ozlabs.org>; Fri, 23 Mar 2018 11:50:54 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2gw3jr224q-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 23 Mar 2018 11:50:53 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 23 Mar 2018 09:50:52 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 23 Mar 2018 09:50:49 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2NFonM511075998; Fri, 23 Mar 2018 08:50:49 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 331D0C6037;
 Fri, 23 Mar 2018 09:50:49 -0600 (MDT)
Received: from [9.41.241.240] (unknown [9.41.241.240])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id A9C61C603E;
 Fri, 23 Mar 2018 09:50:48 -0600 (MDT)
Subject: Re: [PATCH 2/5] serial: expose buf_overrun count through proc
 interface
To: Jeremy Kerr <jk@ozlabs.org>, linux-serial@vger.kernel.org
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 openbmc@lists.ozlabs.org, Jiri Slaby <jslaby@suse.com>
References: <20180321025241.19785-1-jk@ozlabs.org>
 <20180321025241.19785-3-jk@ozlabs.org>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 23 Mar 2018 10:50:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180321025241.19785-3-jk@ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18032315-0008-0000-0000-0000097F6BDE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008729; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000255; SDB=6.01007284; UDB=6.00512933; IPR=6.00786572; 
 MB=3.00020202; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-23 15:50:52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032315-0009-0000-0000-00004682D8D5
Message-Id: <65bc5bf8-af35-055b-5c9d-d983977dc510@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-23_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803230182
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2018 15:50:56 -0000



On 03/20/2018 09:52 PM, Jeremy Kerr wrote:
> The buf_overrun count is only every written, and not exposed to
> userspace anywhere. This means that dropped characters due to flip
> buffer overruns are never visible to userspace.
>
> The /proc/tty/driver/serial file exports a bunch of metrics (including
> hardware overruns) already, so add the buf_overrun (as "bo:") to this
> file.

Tested-by: Eddie James <eajames@linux.vnet.ibm.com>

>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
>   drivers/tty/serial/serial_core.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> index 8f3dfc8b5307..fc677534b510 100644
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -1780,6 +1780,8 @@ static void uart_line_info(struct seq_file *m, struct uart_driver *drv, int i)
>   			seq_printf(m, " brk:%d", uport->icount.brk);
>   		if (uport->icount.overrun)
>   			seq_printf(m, " oe:%d", uport->icount.overrun);
> +		if (uport->icount.buf_overrun)
> +			seq_printf(m, " bo:%d", uport->icount.buf_overrun);
>
>   #define INFOBIT(bit, str) \
>   	if (uport->mctrl & (bit)) \
