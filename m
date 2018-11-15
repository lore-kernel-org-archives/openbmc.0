Return-Path: <tomjose@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42wlQN6R0LzF3fP
 for <openbmc@lists.ozlabs.org>; Fri, 16 Nov 2018 02:19:21 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wAFFImIi028641
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 10:19:19 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2nsb5v0hs0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 10:19:18 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Thu, 15 Nov 2018 15:19:16 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 15 Nov 2018 15:19:14 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 wAFFJE2n62718040
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 15 Nov 2018 15:19:14 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD5B011C04C;
 Thu, 15 Nov 2018 15:19:13 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C92411C054;
 Thu, 15 Nov 2018 15:19:13 +0000 (GMT)
Received: from [9.199.35.99] (unknown [9.199.35.99])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 15 Nov 2018 15:19:13 +0000 (GMT)
Subject: Re: Pamela.py can't run on BMC python env
To: xiuzhi <1450335857@qq.com>, openbmc <openbmc@lists.ozlabs.org>
References: <mailman.9.1542243603.11481.openbmc@lists.ozlabs.org>
 <tencent_3A3ECA558D9BA0F1B9F1A0715AF542A96D05@qq.com>
Cc: ratagupt <ratagupt@linux.vnet.ibm.com>
From: Tom Joseph <tomjose@linux.vnet.ibm.com>
Date: Thu, 15 Nov 2018 20:49:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <tencent_3A3ECA558D9BA0F1B9F1A0715AF542A96D05@qq.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18111515-0016-0000-0000-000002277C6E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18111515-0017-0000-0000-0000327FA099
Message-Id: <c92792d1-a03e-d0d9-62d6-98663904b7d0@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-11-15_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=947 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1811150135
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
X-List-Received-Date: Thu, 15 Nov 2018 15:19:25 -0000

Hello Xiuzhi,

pamela.py depends on the libpam library and find_library is failing. A 
workaround is up for review.

https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-phosphor/+/13092/

Regards,
Tom


On Thursday 15 November 2018 11:56 AM, xiuzhi wrote:
> Hi All,
>    I want to use PAM python module pamela.py  in the 
> /usr/lib/python2.7/site-packages .
>  The error is as follows :
> 1)root@haiguang1:/usr/lib/python2.7/site-packages# python -m pamela -a 
> `whoami`
> Could not import runpy module
>
> 2)root@haiguang1:/usr/lib/python2.7/site-packages# python ./pamela.py
> Traceback (most recent call last):
>   File "./pamela.py", line 143, in <module>
>     PAM_START = LIBPAM.pam_start
>   File "/usr/lib/python2.7/ctypes/__init__.py", line 379, in __getattr__
>     func = self.__getitem__(name)
>   File "/usr/lib/python2.7/ctypes/__init__.py", line 384, in __getitem__
>     func = self._FuncPtr((name_or_ordinal, self))
> AttributeError: python: undefined symbol: pam_start
>
> I run the pamela.py on ubuntu16.04 ,it work very well.
> Who can give me some suggestions?
>
> Best,
> Xiuzhi
