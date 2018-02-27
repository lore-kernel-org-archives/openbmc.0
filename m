Return-Path: <ratagupt@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ratagupt@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zrLSd2g2jzF1Dj
 for <openbmc@lists.ozlabs.org>; Wed, 28 Feb 2018 01:20:07 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1REJPZs116869
 for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2018 09:20:03 -0500
Received: from e06smtp13.uk.ibm.com (e06smtp13.uk.ibm.com [195.75.94.109])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gd8kqh9ju-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2018 09:20:03 -0500
Received: from localhost
 by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@linux.vnet.ibm.com>;
 Tue, 27 Feb 2018 14:20:00 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 27 Feb 2018 14:19:59 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1REJw8a14155948
 for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2018 14:19:58 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A65A64C050
 for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2018 14:13:28 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 466454C059
 for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2018 14:13:28 +0000 (GMT)
Received: from [9.77.211.243] (unknown [9.77.211.243])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2018 14:13:28 +0000 (GMT)
From: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: Re: IPMI Sensor Read-only role updates.
To: openbmc@lists.ozlabs.org
References: <CACkAXSpRB4Lqhd62u+OUALeqCZpSjGD8xSPwx4yJ+WqFH7jNjA@mail.gmail.com>
Date: Tue, 27 Feb 2018 19:49:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CACkAXSpRB4Lqhd62u+OUALeqCZpSjGD8xSPwx4yJ+WqFH7jNjA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 18022714-0012-0000-0000-000005B6020F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18022714-0013-0000-0000-000019320D3F
Message-Id: <c2cfb310-7dae-3f99-a1a3-ceac0ab9c1c8@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-27_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802270180
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
X-List-Received-Date: Tue, 27 Feb 2018 14:20:18 -0000

Hi,

Please find my comments inline

Regards

Ratan Gupta



On Tuesday 27 February 2018 04:51 PM, Jayanth Othayoth wrote:
> I am working on an issue openbmc/openbmc#2500 (Add support for Turbo
> allowed sensor). As part of this issue implementation , there is a
> requirement  to change this IPMI sensor to read only for host.
> Currently all sensors are read/write by design and doesn’t have way to
> change this behavior. Planing to change this behavior by adding
> “Mutability” field in the config.yaml.
>
> As part of this issue am planing to  Initialize  mutability with
> Mutability::Write|Mutability::Read for all sensors and set the
> required sensor mutability Mutability::Read.
>       - Minimal impact on testing and not breaking the existing
> functionality.
RG>>How we would be doing it? If we are planning to do introduce a check 
for a specific sensor then we should not do like this.
In the current design we have not introduced any such checks and we 
should avoid that.
Please correct me if I misunderstood it.
>
> Follow-on story is needed to fix this in generic way like
>   -Add “mutable” field in the config.yaml and initialize the the field
> based on System types also update
> sensorhandler.cpp->ipmi_sen_set_sensor() to do set only for write
> enabled sensor.
>     - This required system specific IPMI sensor behavior review and
> updates in corresponding config.yaml.
RG>> I agree with this approach.What do you mean by "System types" 
here,We have already system specfic YAML in the system specfic meta layers.

>
> Please add your view on this.
