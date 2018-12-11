Return-Path: <stewart@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43DMS75792zDqY4
 for <openbmc@lists.ozlabs.org>; Tue, 11 Dec 2018 12:15:03 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 wBB1EJWt159471
 for <openbmc@lists.ozlabs.org>; Mon, 10 Dec 2018 20:15:01 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2pa1nnuqb1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 10 Dec 2018 20:15:00 -0500
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Tue, 11 Dec 2018 01:15:00 -0000
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 11 Dec 2018 01:14:56 -0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 wBB1Etk919529934
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 11 Dec 2018 01:14:55 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C417D124055;
 Tue, 11 Dec 2018 01:14:55 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8133C124053;
 Tue, 11 Dec 2018 01:14:55 +0000 (GMT)
Received: from birb.localdomain (unknown [9.185.142.54])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 11 Dec 2018 01:14:55 +0000 (GMT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id B32974EC62A; Tue, 11 Dec 2018 12:14:51 +1100 (AEDT)
From: Stewart Smith <stewart@linux.ibm.com>
To: Emily Shaffer <emilyshaffer@google.com>,
 Supreeth Venkatesh <supreeth.venkatesh@arm.com>
Cc: David Thompson <dthompson@mellanox.com>, Dong Wei <Dong.Wei@arm.com>,
 "Naidoo\, Nilan" <nilan.naidoo@intel.com>,
 openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Initial MCTP design proposal
In-Reply-To: <CAJoAoZkPO+dU9VpzCm3C0y1aEFUS_MXBQsTaD_t=gNZN0JHg6A@mail.gmail.com>
References: <a75abc9a6c5c2ae50b39576a60a2bb07c65567d4.camel@ozlabs.org>
 <94639b69-3f3c-a606-ae68-f7e1461097e9@linux.vnet.ibm.com>
 <f8fe02f703ab7c11bf5871605364821688266667.camel@arm.com>
 <CAJoAoZkPO+dU9VpzCm3C0y1aEFUS_MXBQsTaD_t=gNZN0JHg6A@mail.gmail.com>
Date: Tue, 11 Dec 2018 12:14:51 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18121101-0040-0000-0000-000004A09C29
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010210; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000270; SDB=6.01129972; UDB=6.00577119; IPR=6.00910106; 
 MB=3.00024648; MTD=3.00000008; XFM=3.00000015; UTC=2018-12-11 01:14:58
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18121101-0041-0000-0000-000008A9BBD6
Message-Id: <87efaoj244.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-12-11_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=992 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812110010
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
X-List-Received-Date: Tue, 11 Dec 2018 01:15:04 -0000

Emily Shaffer <emilyshaffer@google.com> writes:
>> > > The reason for a library is to allow the same MCTP implementation
>> > > to be
>> > > used in both OpenBMC and host firmware; the library should be
>> > > bidirectional. To allow this, the library would be written in
>> > > portable C
>> > > (structured in a way that can be compiled as "extern C" in C++
>> > > codebases), and be able to be configured to suit those runtime
>> > > environments (for example, POSIX IO may not be available on all
>> > > platforms; we should be able to compile the library to suit). The
>> > > licence for the library should also allow this re-use; I'd suggest
>> > > a
>> > > dual Apache & GPL licence.
>>
>
> Love the idea of the implementation being bidirectional and able to be
> dropped onto the host side as well, but I must be missing why that requires
> we write it in C.  Are we targeting some platform missing a C++
> cross-compiler implementation? If we're implementing something new from
> scratch, I'd so much prefer to bump up the maintainability/modernity and
> write it in C++ if we can.  Or could be I'm missing some key reason that it
> follows we use C :)

We're certainly missing C++ runtime libraries and support, so that would
be an interesting set of limitations. Even as it is, our C libraries are
pretty limited.

If we were going to bring a not-C language into firmware, I'd prefer we
look at something modern like Rust, that's designed to not have
programmers marching around with guns pointed at their feet.
(I have C++ opinions, most of which can be summarised by NAK :)

-- 
Stewart Smith
OPAL Architect, IBM.
