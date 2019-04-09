Return-Path: <mspinler@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44dpbK06BRzDqBs
 for <openbmc@lists.ozlabs.org>; Tue,  9 Apr 2019 23:50:44 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x39Dlvu9138281
 for <openbmc@lists.ozlabs.org>; Tue, 9 Apr 2019 09:50:40 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2rru8vmk3u-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 09 Apr 2019 09:50:40 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.ibm.com>;
 Tue, 9 Apr 2019 14:50:39 +0100
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 9 Apr 2019 14:50:37 +0100
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x39Doatb14352530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 9 Apr 2019 13:50:36 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39C05124055;
 Tue,  9 Apr 2019 13:50:36 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3CE4124054;
 Tue,  9 Apr 2019 13:50:35 +0000 (GMT)
Received: from [9.10.99.36] (unknown [9.10.99.36])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  9 Apr 2019 13:50:35 +0000 (GMT)
Subject: Re: using phosphor-dbus-monitor
To: Wim Vervoorn <wvervoorn@eltan.com>, Lei YU <mine260309@gmail.com>,
 Matthew Barth <msbarth@linux.ibm.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
References: <8daf9ac9deee4bc0808a55733681d67e@Eltsrv03.Eltan.local>
 <CAARXrtmt9ObNmmkS2H2Qmon6qXVHiSjVmuyrfLXpzsSqP7j5PA@mail.gmail.com>
 <bdc0e08ece734d44b8eebad84eb5db35@Eltsrv03.Eltan.local>
From: Matt Spinler <mspinler@linux.ibm.com>
Date: Tue, 9 Apr 2019 08:50:36 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <bdc0e08ece734d44b8eebad84eb5db35@Eltsrv03.Eltan.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19040913-0064-0000-0000-000003C876B2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010895; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01186603; UDB=6.00621484; IPR=6.00967364; 
 MB=3.00026361; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-09 13:50:38
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19040913-0065-0000-0000-00003D00552D
Message-Id: <0f2fc6f7-be66-ab65-7b90-b0bdd45d5fcd@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-09_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904090088
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
X-List-Received-Date: Tue, 09 Apr 2019 13:50:58 -0000

Hi Wim,

If you could post your YAML somewhere, I could take a look for any 
obvious problems.

On 4/9/2019 2:23 AM, Wim Vervoorn wrote:
> Hello Lei,
>
> Thanks for your response. I know this example too and it helps a bit but it doesn’t really clarify all issues.
>
> As you've worked with this as well. Do you understand the meta item? The example indicates it has different meaning but doesn't provide any pointers to what those meanings are. Have you been able to find out?
>
> Best Regards,
> Wim Vervoorn
>
> -----Original Message-----
> From: Lei YU [mailto:mine260309@gmail.com]
> Sent: Tuesday, April 9, 2019 5:44 AM
> To: Wim Vervoorn <wvervoorn@eltan.com>; Matthew Barth <msbarth@linux.ibm.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: using phosphor-dbus-monitor
>
>> I am trying to use phosphor-dbus-monitor to create logging of sensor exceptions like a Critical state on a specific sensor.
>> I am able to create a solution with a building yaml but at the end it doesn’t deliver me the desired result.
>> As there are very limited examples (on a few in the witherspoon) it is very hard to figure out where the mistake is.
> There is an example yaml config in the repo:
> https://github.com/openbmc/phosphor-dbus-monitor/blob/master/src/example/example.yaml
>
> And I have the same feeling that it's hard to know what's wrong if something is wrong.ei
>
>> Are there any tools that can be used to make this easier?
> @Matthew Barth Could you kindly help to add some doc/tool to make it easier to use?
>
>> Additionally is this the correct method to achieve this goal or should I use something else to define conditions for logging?
> I think so. This repo is intended to watch the dbus and do stuff as yaml config.
>
>
