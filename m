Return-Path: <jrey@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43k6cs5DC2zDqSw
 for <openbmc@lists.ozlabs.org>; Tue, 22 Jan 2019 10:06:53 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0LMxBXO079018
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jan 2019 18:06:51 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2q5pn2shgc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jan 2019 18:06:50 -0500
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.vnet.ibm.com>;
 Mon, 21 Jan 2019 23:06:49 -0000
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 21 Jan 2019 23:06:45 -0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x0LN6i1g27459788
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 21 Jan 2019 23:06:45 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE2A4BE051;
 Mon, 21 Jan 2019 23:06:44 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88A98BE053;
 Mon, 21 Jan 2019 23:06:44 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 21 Jan 2019 23:06:44 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 21 Jan 2019 17:12:34 -0600
From: Joseph Reynolds <jrey@linux.vnet.ibm.com>
To: Brenden Lai <Brenden_Lai@jabil.com>
Cc: Nancy Yuen <yuenn@google.com>, John Wang <wangzqbj@inspur.com>,
 openbmc@lists.ozlabs.org, openbmc
 <openbmc-bounces+jrey=linux.vnet.ibm.com@lists.ozlabs.org>
Subject: RE: couple questions for OpenBMC - license
In-Reply-To: <SN6PR02MB569328246D6D9163D1A93850969C0@SN6PR02MB5693.namprd02.prod.outlook.com>
References: <SN6PR02MB5693D3A8387A48C7453FEC0796830@SN6PR02MB5693.namprd02.prod.outlook.com>
 <CAHkHK08_MujVhwv2SaPfNPn+bS36a3uLEWjfvYU+CkFFE_2j4Q@mail.gmail.com>
 <CADfYTpE2fxL7KNZp7AvW9wh2hzHp9wHzXORLRg8jnj-6_BcbPA@mail.gmail.com>
 <SN6PR02MB569328246D6D9163D1A93850969C0@SN6PR02MB5693.namprd02.prod.outlook.com>
X-Sender: jrey@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19012123-0016-0000-0000-00000978BC77
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010450; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000275; SDB=6.01149867; UDB=6.00599181; IPR=6.00930192; 
 MB=3.00025228; MTD=3.00000008; XFM=3.00000015; UTC=2019-01-21 23:06:47
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19012123-0017-0000-0000-000041DC79B6
Message-Id: <219314fcce5200ff3de7252525226d3b@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-21_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901210180
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
X-List-Received-Date: Mon, 21 Jan 2019 23:06:54 -0000

On 2019-01-17 19:55, Brenden Lai wrote:
> Thanks Nancy .
> 
> FROM: Nancy Yuen <yuenn@google.com>
>  SENT: Friday, January 18, 2019 2:29 AM
>  TO: John Wang <wangzqbj@inspur.com>
>  CC: Brenden Lai <Brenden_Lai@jabil.com>; openbmc@lists.ozlabs.org
>  SUBJECT: Re: couple questions for OpenBMC
> 
> On Thu, Jan 17, 2019 at 2:34 AM John Wang <wangzqbj@inspur.com> wrote:
> 
> 
>> On Thu, Jan 17, 2019 at 3:52 PM Brenden Lai <Brenden_Lai@jabil.com>
>> wrote:
>>> 
>>> Hi
>>> 
>>> I have couple questions about OpenBMC .
>> 
>>> 
>>> 1.if I decide use OpenBMC solution , Does it mean I should put
>> all BMC source code on github including some commercial software ?
> 
> I don't know what you mean by commercial software. In OpenBMC we
> strive to use open source software.

I understood this question was about the license agreement.  If I 
interpret Brenden's question correctly, the OpenBMC project retrieves 
code from many other projects and is itself licensed for use variously 
with the MIT and Apache licenses which are permissive and allow someone 
to use the code in a commercial project.

Additionally, the build process has an option to create a "bill of 
materials" (BOM) which lists all source projects retrieved along with 
their licenses.  However, I don't have direct experience with this, and 
you would typically have your lawyers review your situation.

See for example:

https://github.com/openbmc/openbmc/blob/master/poky/LICENSE

https://github.com/openbmc/bmcweb/blob/master/LICENCE

https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/LICENSE

- Joseph

...snip...

>>> 
>>> Thanks -Brenden
>>> 
>>> 
>>> 
>>> 
>>> 
>>> Brenden Lai
>>> SR. BMC Design Engineer
>>> E&I, Jabil Design Services
>>> 
...snip...
