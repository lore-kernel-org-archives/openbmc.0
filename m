Return-Path: <SRS0=tq6m=GO=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E567C433DB
	for <openbmc@archiver.kernel.org>; Mon, 11 Jan 2021 18:21:25 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ABFF222B6
	for <openbmc@archiver.kernel.org>; Mon, 11 Jan 2021 18:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ABFF222B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DF28d209yzDqcv
	for <openbmc@archiver.kernel.org>; Tue, 12 Jan 2021 05:21:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=gmills@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jGT8tOws; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DF26n34nJzDqb1
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 05:19:37 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10BI2mw9158525; Mon, 11 Jan 2021 13:19:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : cc : from : subject
 : message-id : date : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=dFGg2kjDYw9aL+yME407WPldhoKFWeTirvU2zXnWCmM=;
 b=jGT8tOws+8J/gJC4uUHYKzsiQN7DfJ2ug9RhRu/ffAAO0isNtCQeBpSvyVsqQbkOuwNB
 mC0EfvUDKZEvcJ9QvIo6Ng5z1IaIdXpEZMN4N3TiFSARd+sAdhQBllNvVp242lNxmQjg
 trehdcrJKbnGZysQ6R85dq3eskNQvEIn0gvnihUEIZXQEXDM/z59gbJfXFwg/5VWli8l
 uEIEkdwWN5V3UaxLC/MLHCjXOqmNEWjuEw70/BX1HVqKh+kMmxb5LzTTKMC1j4SqsGGz
 M5+JvH3uCqXU4E5KZFkH7tyeSJLThF6knQizWXOluzoXpl6ewBcrVTfRZOqWwe2fgfWY yg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 360udc0u2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 13:19:32 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10BI84Hx023696;
 Mon, 11 Jan 2021 18:19:32 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 35y4494j1g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jan 2021 18:19:31 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10BIJUZU30802404
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jan 2021 18:19:30 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B11F06E04C;
 Mon, 11 Jan 2021 18:19:30 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D29CA6E050;
 Mon, 11 Jan 2021 18:19:28 +0000 (GMT)
Received: from [9.206.205.74] (unknown [9.206.205.74])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 11 Jan 2021 18:19:28 +0000 (GMT)
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
Subject: Switch SensorCollection to show all sensors as new power/thermal
 schemas implemented
Message-ID: <3475dcc0-5630-b18d-5cbe-e36ba1454fc4@linux.vnet.ibm.com>
Date: Mon, 11 Jan 2021 11:19:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-11_29:2021-01-11,
 2021-01-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 clxscore=1011 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101110100
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
Cc: Ed Tanous <ed@tanous.net>, Lei Yu <yulei.sh@bytedance.com>, "Li,
 Yong B" <yong.b.li@intel.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Similar discussion has been on the mailing list before: 
https://lists.ozlabs.org/pipermail/openbmc/2020-October/023568.html

The new PowerSubsystem/ThermalSubsystem Redfish schemas can coexist with 
the old Power/Thermal schemas. I suspect we will have both the new and 
old for some time. As we implement the new 
PowerSubsystem/ThermalSubsystem is it okay to switch the behavior of the 
sensor collection from "show sensors that are not covered elsewhere in 
the model" to "show all sensors" as the new 
PowerSubsystem/ThermalSubsystem schemas call for?

I reposted in 
https://redfishforum.com/thread/190/sensorcollection-contain-all-sensors-chassis, 
unless I am missing something I believe Redfish's guidance will be "move 
to a SensorCollection that shows all the sensors". If indeed that is 
their guidance, is everyone okay as we implement the new 
PowerSubsystem/ThermalSubsystem in bmcweb, we move sensor collection to 
show all sensors? Things like webui-vue will have to be updated (not 
sure anything breaks for webui-vue just would have duplicate sensors).

Thanks,
Gunnar
