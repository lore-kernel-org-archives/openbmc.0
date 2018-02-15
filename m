Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zj0yQ1l2PzF1Gv
 for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2018 02:47:09 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1FFkqeZ096397
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 10:47:07 -0500
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2g5c673car-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 10:47:06 -0500
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 15 Feb 2018 10:47:04 -0500
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 15 Feb 2018 10:47:02 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1FFl2KY49479732; Thu, 15 Feb 2018 15:47:02 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6FBCE112034;
 Thu, 15 Feb 2018 10:45:02 -0500 (EST)
Received: from [9.85.172.122] (unknown [9.85.172.122])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id CE8C7112051;
 Thu, 15 Feb 2018 10:45:01 -0500 (EST)
Subject: Re: [PATCH linux dev-4.10 01/16] fsi: sbefifo: Rename
 sbefifo_release_client() for consistency
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au, jk@ozlabs.org,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
References: <20180215123606.25777-1-andrew@aj.id.au>
 <20180215123606.25777-2-andrew@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 15 Feb 2018 09:47:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180215123606.25777-2-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18021515-0024-0000-0000-0000032711C8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008539; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000253; SDB=6.00990134; UDB=6.00502822; IPR=6.00769482; 
 MB=3.00019572; MTD=3.00000008; XFM=3.00000015; UTC=2018-02-15 15:47:04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18021515-0025-0000-0000-0000470A44BE
Message-Id: <3719d621-e45e-8285-a1dc-5e941b790330@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-15_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802150193
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
X-List-Received-Date: Thu, 15 Feb 2018 15:47:10 -0000



On 02/15/2018 06:35 AM, Andrew Jeffery wrote:
> We have sbefifo_new_client(), which feels unmatched by the currently named
> sbefifo_client_release().

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>

>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/fsi/fsi-sbefifo.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index 0697a10d3eb3..4ac9e188e683 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -314,7 +314,7 @@ static struct sbefifo_client *sbefifo_new_client(struct sbefifo *sbefifo)
>   	return client;
>   }
>
> -static void sbefifo_client_release(struct kref *kref)
> +static void sbefifo_release_client(struct kref *kref)
>   {
>   	struct sbefifo *sbefifo;
>   	struct sbefifo_client *client;
> @@ -353,7 +353,7 @@ static void sbefifo_get_client(struct sbefifo_client *client)
>
>   static void sbefifo_put_client(struct sbefifo_client *client)
>   {
> -	kref_put(&client->kref, sbefifo_client_release);
> +	kref_put(&client->kref, sbefifo_release_client);
>   }
>
>   static struct sbefifo_xfr *sbefifo_next_xfr(struct sbefifo *sbefifo)
