Return-Path: <SRS0=GQ2/=N6=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271C0C433F5
	for <openbmc@archiver.kernel.org>; Wed,  8 Sep 2021 22:11:26 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E46961100
	for <openbmc@archiver.kernel.org>; Wed,  8 Sep 2021 22:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E46961100
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4bvH5nv6z2yLv
	for <openbmc@archiver.kernel.org>; Thu,  9 Sep 2021 08:11:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tp8Cb4ZD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bruce.mitchell@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Tp8Cb4ZD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4btN4WBqz2xY9
 for <openbmc@lists.ozlabs.org>; Thu,  9 Sep 2021 08:10:35 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 188M4X3K144818; Wed, 8 Sep 2021 18:10:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=to : from : subject : cc
 : message-id : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=b9x3oRh8MZw+fajwDTUTnPibc6ayG4FOeIE6rifl6eg=;
 b=Tp8Cb4ZDQA3JKTBVyxcbT4b/OJC443C8POd2PQrcj16k4UlRTl/DZzaffbQGJqg9N1Vf
 iedXYzRr/759VxaO1nXrhpSDI8RBwIb8heVTgrhqUZG5YV4YhUEzPfLh0B8Vgs53FGA6
 RbiUlFrq6p7cqrIiJwOG36ptAg2U9gnO/Kv3kJgXfMyogpgHpC+ZJ8490KC1e3FQkLy5
 +6fqvV/wgxxGAGRqxIzvmqDdB3R8zV/S77gRWR4OmlW3wXJZB00lzeufQIf47sNrsFFV
 zpC+BnZGyKken93R71UW79KgS44CsaYPGFQl62t7gVGxOflyF2pb83ZQhS57ysIsD8zM PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3axuwjrge5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 18:10:32 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 188M69qL004771;
 Wed, 8 Sep 2021 18:10:32 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3axuwjrgdv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 18:10:32 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 188M7PXD012160;
 Wed, 8 Sep 2021 22:10:31 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03wdc.us.ibm.com with ESMTP id 3axcnpp8g7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 22:10:31 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 188MAUmk10748516
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Sep 2021 22:10:30 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AA36AE075;
 Wed,  8 Sep 2021 22:10:30 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20F94AE06D;
 Wed,  8 Sep 2021 22:10:30 +0000 (GMT)
Received: from [9.163.8.88] (unknown [9.163.8.88])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  8 Sep 2021 22:10:29 +0000 (GMT)
To: linux-iio@vger.kernel.org
From: Bruce Mitchell <bruce.mitchell@linux.vnet.ibm.com>
Subject: Looking for clarification on sysfs IIO devices, do _raw devices
 require both _offset and _scale?
Message-ID: <cc74f30f-9ab8-45ce-1f44-8e55c3f9c5ce@linux.vnet.ibm.com>
Date: Wed, 8 Sep 2021 15:10:29 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vZVx-s3ktMXmxkZ-ANW_G8woawIqPiAD
X-Proofpoint-ORIG-GUID: D_yOftcodq6APUje3OThdH2xvvos9gAf
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-08_09:2021-09-07,
 2021-09-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999
 phishscore=0 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109080137
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>, Ed Tanous <edtanous@google.com>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

In reference to:
https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-bus-iio

I have Temperature, Pressure, and Humidity IIO sensors.
IIO _raw devices look like this on sysfs:
   this happens to be a SI7020 type device with 2 sensors
     /sys/bus/iio/devices/iio:device0/in_humidityrelative_offset
     /sys/bus/iio/devices/iio:device0/in_humidityrelative_raw
     /sys/bus/iio/devices/iio:device0/in_humidityrelative_scale
     /sys/bus/iio/devices/iio:device0/in_temp_offset
     /sys/bus/iio/devices/iio:device0/in_temp_raw
     /sys/bus/iio/devices/iio:device0/in_temp_scale

Other IIO _input devices look like this on sysfs:
   this happens to be a DPS310 device with 2 sensors
      /sys/bus/iio/devices/iio:device1/in_temp_input
      /sys/bus/iio/devices/iio:device1/in_pressure_input

As I read it if the IIO device was an _input type on sysfs,
just read it (and possibly scale it for units).

But if the IIO device was a _raw type on sysfs my understanding
is that it must be accompanied by a _offset and a _scale for
at least temperature, pressure, humidity, voltage, and current
sensors.
Is that correct?

Further for any IIO device that is a _raw type on sysfs is it
required to be accompanied by a _offset and a _scale as well?


Thank you!

-- 
Bruce
