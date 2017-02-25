Return-Path: <vsainath@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vVcYn1W8GzDqGv
 for <openbmc@lists.ozlabs.org>; Sat, 25 Feb 2017 16:52:13 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1P5nvYx032983
 for <openbmc@lists.ozlabs.org>; Sat, 25 Feb 2017 00:52:08 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28u3s8ggas-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 25 Feb 2017 00:52:08 -0500
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vsainath@linux.vnet.ibm.com>;
 Fri, 24 Feb 2017 22:52:07 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 24 Feb 2017 22:52:05 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 7CBA419D801C;
 Fri, 24 Feb 2017 22:51:16 -0700 (MST)
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1P5q4FF15794528; Fri, 24 Feb 2017 22:52:04 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFCADBE039;
 Fri, 24 Feb 2017 22:52:04 -0700 (MST)
Received: from Venkateshs-MacBook-Pro.local (unknown [9.199.34.91])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id E055EBE040;
 Fri, 24 Feb 2017 22:52:02 -0700 (MST)
Subject: Re: sbefifo userspace api
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <2259983.WKARIp1cGE@new-mexico>
 <EA559E13-0C15-4329-8149-82B98ED732C6@fuzziesquirrel.com>
 <10497628.zEIs9p2if1@new-mexico>
 <8bc42a68-bd12-49c9-9da6-8ad59613d703@linux.vnet.ibm.com>
 <B32A5EFD-11C2-4FF3-9F70-07018A86CBF7@fuzziesquirrel.com>
Cc: Alistair Popple <alistair@popple.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
From: Venkatesh Sainath <vsainath@linux.vnet.ibm.com>
Date: Sat, 25 Feb 2017 11:22:00 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <B32A5EFD-11C2-4FF3-9F70-07018A86CBF7@fuzziesquirrel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022505-0016-0000-0000-000006463E0D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006679; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00826763; UDB=6.00404962; IPR=6.00604219; 
 BA=6.00005171; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014433; XFM=3.00000011;
 UTC=2017-02-25 05:52:06
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022505-0017-0000-0000-000037B522C0
Message-Id: <82b46e6b-459e-8a38-9aaf-d0c6eac44e0f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-25_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702250050
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sat, 25 Feb 2017 05:52:13 -0000



On 25/02/17 11:13 AM, Brad Bishop wrote:
>> On Feb 25, 2017, at 12:14 AM, Venkatesh Sainath <vsainath@linux.vnet.ibm.com> wrote:
>>
>>
>>
>> On 24/02/17 11:44 AM, Alistair Popple wrote:
>>> On Thu, 23 Feb 2017 10:01:15 PM Brad Bishop wrote:
>>>> Based on what we’ve discussed here and a couple offline discussions,
>>>> I’m making some assertions below.  I’d like for this note to be a
>>>> “last call for discussion” (as much as that is possible) so we can
>>>> start hacking; please try and raise any concerns by sometime next week.
>>>>
>>>> - sbefifo DD will implement read and write system calls.  A write
>>>> will put data in the upstream fifo.  A read will pull data out of
>>>> the downstream fifo.
>> Brad,
>> Thanks for summarising the discussion. Instead of independent read/write calls, I was looking for a single ioctl(submit) operation which would always do a write of the incoming data packet to the upstream fifo followed by a read of a byte stream from the downstream fifo. There can be multiple users who open file descriptors to the sbe fifo in write mode. However, each ioctl(fd,submit,data) operation will be protected such that no two submit operations will happen in parallel.
> The driver can/will still provide this protection, even with a read/write
> interface.
>
>> This way (a) the users dont have to know the semantics of the sbe fifo status bits ( data valid / end-of-transmission)
> I don’t think a read/write interface necessitates this.
>
>> and (b) there wont be any collision of write and read operations between two users.
> If a user writes to an fd, the sbe response will only come out with
> a read on that same fd.  If some other fd is read from (before or after
> read is called on the first fd), that read is just going to block (until
> _that_ fd is written to).
>
>> I am hoping this does not violate any linux DD norms.
> I’ve been told by multiple folks that read/write is the “interface of least
> surprise” in the general Linux sense.  Given that, I chose read/write over
> an ioctl to maximize our chances of getting this driver incorporated into
> upstream Linux.
>
> A wrapper to get a submit-like interface could look like this:
>
> int submit(const char* in, size_t len, char** out)
> {
>      char buf[1024];
>      ssize_t read = 0;
>
>      int fd = open(“/dev/sbefifo”);
>      int rc = write(fd, in, len);
>      
>      while((rc = read(fd, &buf, sizeof(buf))) > 0)
>      {
>         read += rc;
>         /* copy out… */
>      }
>
>      return read;
> }
>
> That should be workable, right?
Agreed. Also, a write(fd1), write(fd2), read(fd1) should not be allowed 
as it can confuse the SBE which is waiting for its downstream fifo to be 
pulled by BMC and it receives more data on its upstream fifo. A write on 
a given fd should always be followed by a read on the same fd. Two 
writes or two reads should not be followed in sequence. Two back-to-back 
reads can result in sbefifo DD experiencing a false sbe response timeout 
as there is nothing to be sent by SBE and sbefifo DD is waiting on the 
downstream fifo.
>> -Venkatesh
> -brad
