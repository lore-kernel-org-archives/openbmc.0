Return-Path: <vsainath@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vVctt3f7dzDqGv
 for <openbmc@lists.ozlabs.org>; Sat, 25 Feb 2017 17:07:02 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1P64tD9044601
 for <openbmc@lists.ozlabs.org>; Sat, 25 Feb 2017 01:06:58 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28u3rvrvrb-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 25 Feb 2017 01:06:58 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vsainath@linux.vnet.ibm.com>;
 Fri, 24 Feb 2017 23:06:57 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 24 Feb 2017 23:06:56 -0700
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id A47EC3E4003E;
 Fri, 24 Feb 2017 23:06:55 -0700 (MST)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1P66txu9437514; Fri, 24 Feb 2017 23:06:55 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 77E9D6A03F;
 Fri, 24 Feb 2017 23:06:55 -0700 (MST)
Received: from Venkateshs-MacBook-Pro.local (unknown [9.199.34.91])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 69B5F6A03C;
 Fri, 24 Feb 2017 23:06:53 -0700 (MST)
Subject: Re: sbefifo userspace api
To: Alistair Popple <alistair@popple.id.au>
References: <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <B32A5EFD-11C2-4FF3-9F70-07018A86CBF7@fuzziesquirrel.com>
 <82b46e6b-459e-8a38-9aaf-d0c6eac44e0f@linux.vnet.ibm.com>
 <14449220.QbBthjjsGh@new-mexico>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
From: Venkatesh Sainath <vsainath@linux.vnet.ibm.com>
Date: Sat, 25 Feb 2017 11:36:51 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <14449220.QbBthjjsGh@new-mexico>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17022506-0012-0000-0000-000013C4EF99
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006679; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00826767; UDB=6.00404964; IPR=6.00604222; 
 BA=6.00005171; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014433; XFM=3.00000011;
 UTC=2017-02-25 06:06:57
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17022506-0013-0000-0000-00004BBBD240
Message-Id: <acf9bff7-68c2-eaf8-ed8b-0a1fc2b66437@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-25_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702250057
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
X-List-Received-Date: Sat, 25 Feb 2017 06:07:02 -0000



On 25/02/17 11:26 AM, Alistair Popple wrote:
> Hi,
>
> On Sat, 25 Feb 2017 11:22:00 AM Venkatesh Sainath wrote:
>> On 25/02/17 11:13 AM, Brad Bishop wrote:
>>>> On Feb 25, 2017, at 12:14 AM, Venkatesh Sainath <vsainath@linux.vnet.ibm.com> wrote:
>>>>
>>>>
>>>>
>>>> On 24/02/17 11:44 AM, Alistair Popple wrote:
>>>>> On Thu, 23 Feb 2017 10:01:15 PM Brad Bishop wrote:
>>>>>> Based on what we’ve discussed here and a couple offline discussions,
>>>>>> I’m making some assertions below.  I’d like for this note to be a
>>>>>> “last call for discussion” (as much as that is possible) so we can
>>>>>> start hacking; please try and raise any concerns by sometime next week.
>>>>>>
>>>>>> - sbefifo DD will implement read and write system calls.  A write
>>>>>> will put data in the upstream fifo.  A read will pull data out of
>>>>>> the downstream fifo.
>>>> Brad,
>>>> Thanks for summarising the discussion. Instead of independent read/write calls, I was looking for a single ioctl(submit) operation which would always do a write of the incoming data packet to the upstream fifo followed by a read of a byte stream from the downstream fifo. There can be multiple users who open file descriptors to the sbe fifo in write mode. However, each ioctl(fd,submit,data) operation will be protected such that no two submit operations will happen in parallel.
>>> The driver can/will still provide this protection, even with a read/write
>>> interface.
>>>
>>>> This way (a) the users dont have to know the semantics of the sbe fifo status bits ( data valid / end-of-transmission)
>>> I don’t think a read/write interface necessitates this.
>>>
>>>> and (b) there wont be any collision of write and read operations between two users.
>>> If a user writes to an fd, the sbe response will only come out with
>>> a read on that same fd.  If some other fd is read from (before or after
>>> read is called on the first fd), that read is just going to block (until
>>> _that_ fd is written to).
>>>
>>>> I am hoping this does not violate any linux DD norms.
>>> I’ve been told by multiple folks that read/write is the “interface of least
>>> surprise” in the general Linux sense.  Given that, I chose read/write over
>>> an ioctl to maximize our chances of getting this driver incorporated into
>>> upstream Linux.
>>>
>>> A wrapper to get a submit-like interface could look like this:
>>>
>>> int submit(const char* in, size_t len, char** out)
>>> {
>>>       char buf[1024];
>>>       ssize_t read = 0;
>>>
>>>       int fd = open(“/dev/sbefifo”);
>>>       int rc = write(fd, in, len);
>>>
>>>       while((rc = read(fd, &buf, sizeof(buf))) > 0)
>>>       {
>>>          read += rc;
>>>          /* copy out… */
>>>       }
>>>
>>>       return read;
>>> }
>>>
>>> That should be workable, right?
>> Agreed. Also, a write(fd1), write(fd2), read(fd1) should not be allowed
>> as it can confuse the SBE which is waiting for its downstream fifo to be
>> pulled by BMC and it receives more data on its upstream fifo. A write on
>> a given fd should always be followed by a read on the same fd. Two
>> writes or two reads should not be followed in sequence. Two back-to-back
>> reads can result in sbefifo DD experiencing a false sbe response timeout
>> as there is nothing to be sent by SBE and sbefifo DD is waiting on the
>> downstream fifo.
> I think you are confusing the read/write system calls with the
> read/write calls to the fifo. The kernel driver is responsible for
> ensuring a sequence of write(fd1), write(fd2), read(fd1) syscalls
> results in a sequence of write(fd1), read(fd1), write(fd2) calls to
> the SBE FIFO.
Thanks for correcting me :-) Also, the kernel driver should return error 
if a read(fd) is done without a preceding write(fd). This error must be 
returned by kernel driver before touching the fifo itself. One more 
use-case to cover --- If a read(fd) is done with a not-so-large-enough 
buffer, then kernel driver should flush the downstream fifo until it is 
empty and return buffer-too-small error to the caller. User cannot 
allocate a bigger buffer and retry read(fd) as it will end up in two 
consecutive reads without a write.

-Venkatesh
> - Alistair
>
>>>> -Venkatesh
>>> -brad
