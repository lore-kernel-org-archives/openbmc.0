Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44krXQ4SJpzDqQ4
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 04:35:49 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3HISgPK050087
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 14:35:47 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rx6f3fpf4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 14:35:47 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Wed, 17 Apr 2019 19:35:46 +0100
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 17 Apr 2019 19:35:44 +0100
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3HIZhwN23658606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Apr 2019 18:35:43 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82C15136066;
 Wed, 17 Apr 2019 18:35:43 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B212F136059;
 Wed, 17 Apr 2019 18:35:42 +0000 (GMT)
Received: from [9.85.213.5] (unknown [9.85.213.5])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 17 Apr 2019 18:35:42 +0000 (GMT)
Subject: Re: [PATCH v2 1/1] hwmon (occ): Add temp sensor value check
To: Alexander Amelkin <a.amelkin@yadro.com>, linux-hwmon@vger.kernel.org
Cc: "Edward A . James" <eajames@us.ibm.com>, openbmc@lists.ozlabs.org,
 Alexander Soldatov <a.soldatov@yadro.com>
References: <6a6dd936-9f97-dcfe-65a1-d724a7c20297@yadro.com>
 <1555524209-26997-1-git-send-email-a.amelkin@yadro.com>
From: Eddie James <eajames@linux.ibm.com>
Date: Wed, 17 Apr 2019 13:35:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1555524209-26997-1-git-send-email-a.amelkin@yadro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19041718-0020-0000-0000-00000ED8F4C8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010945; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01190481; UDB=6.00623837; IPR=6.00971280; 
 MB=3.00026488; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-17 18:35:46
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19041718-0021-0000-0000-000065781DA7
Message-Id: <48e874f0-c865-12c7-cf93-5e569c27f877@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-17_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904170123
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Apr 2019 18:35:51 -0000


On 4/17/19 1:03 PM, Alexander Amelkin wrote:
> From: Alexander Soldatov <a.soldatov@yadro.com>
>
> The occ driver supports two formats for the temp sensor value.
>
> The OCC firmware for P8 supports only the first format, for which
> no range checking or error processing is performed in the driver.
> Inspecting the OCC sources for P8 reveals that OCC may send
> a special value 0xFFFF to indicate that a sensor read timeout
> has occurred, see
>
> https://github.com/open-power/occ/blob/master_p8/src/occ/cmdh/cmdh_fsp_cmds.c#L395
>
> That situation wasn't handled in the driver. This patch adds invalid
> temp value check for the sensor data format 1 and handles it the same
> way as it is done for the format 2, where EREMOTEIO is reported for
> this case.


Thanks Alexander and Guenter.


Reviewed-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Alexander Soldatov <a.soldatov@yadro.com>
> Signed-off-by: Alexander Amelkin <a.amelkin@yadro.com>
> Reviewed-by: Alexander Amelkin <a.amelkin@yadro.com>
> Cc: Edward A. James <eajames@us.ibm.com>
> Cc: Joel Stanley <joel@jms.id.au>
> ---
>   drivers/hwmon/occ/common.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index 4679acb..825631c 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -235,6 +235,12 @@ static ssize_t occ_show_temp_1(struct device *dev,
>   		val = get_unaligned_be16(&temp->sensor_id);
>   		break;
>   	case 1:
> +		/*
> +		 * If a sensor reading has expired and couldn't be refreshed,
> +		 * OCC returns 0xFFFF for that sensor.
> +		 */
> +		if (temp->value == 0xFFFF)
> +			return -EREMOTEIO;
>   		val = get_unaligned_be16(&temp->value) * 1000;
>   		break;
>   	default:
