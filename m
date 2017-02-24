Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vVRzq1fpkzDqH5
 for <openbmc@lists.ozlabs.org>; Sat, 25 Feb 2017 10:25:42 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v1ONJXNG058683
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 18:25:40 -0500
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 28thjbxu2p-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 18:25:39 -0500
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 24 Feb 2017 16:25:39 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 24 Feb 2017 16:25:37 -0700
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id B2B8D1FF0021
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 16:25:14 -0700 (MST)
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v1ONPbdb11141618
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 16:25:37 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5A741136044
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 16:25:37 -0700 (MST)
Received: from d50lp33.co.us.ibm.com (unknown [9.17.249.38])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS id 457F613603C
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 16:25:37 -0700 (MST)
Received: from localhost
 by d50lp33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 24 Feb 2017 16:25:37 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.90)
 by d50lp33.co.us.ibm.com (192.168.2.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Fri, 24 Feb 2017 16:25:36 -0700
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 24 Feb 2017 23:25:35 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 24 Feb 2017 23:25:31 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2017022423253160-534793 ;
 Fri, 24 Feb 2017 23:25:31 +0000 
In-Reply-To: <10497628.zEIs9p2if1@new-mexico>
Subject: Re: sbefifo userspace api
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Alistair Popple <alistair@popple.id.au>
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>, Christopher Bostic
 <cbostic@linux.vnet.ibm.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Venkatesh Sainath <vsainath@linux.vnet.ibm.com>
Date: Fri, 24 Feb 2017 23:25:31 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <10497628.zEIs9p2if1@new-mexico>,
 <9AF20EDE-4CE2-430F-882A-4DB86BBD89BF@fuzziesquirrel.com>
 <2259983.WKARIp1cGE@new-mexico>
 <EA559E13-0C15-4329-8149-82B98ED732C6@fuzziesquirrel.com>
X-Mailer: IBM iNotes ($HaikuForm 914) | IBM Domino Build
 SCN_20170214T0215_FP2.2 February 23, 2017 at 8:15
X-LLNOutbound: False
X-Disclaimed: 30887
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 17022423-0028-0000-0000-00000722D9E6
X-IBM-SpamModules-Scores: FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0.404685;
 ST=0; TS=0; UL=0; ISC=; MB=0.378700
X-IBM-SpamModules-Versions: BY=3.00006677; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00826660; UDB=6.00404899; IPR=6.00604111; 
 BA=6.00005171; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014430; XFM=3.00000011;
 UTC=2017-02-24 23:25:33
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-02-24 23:02:31 - 6.00006345
x-cbparentid: 17022423-9718-0000-0000-00000452D716
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006677; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000204; SDB=6.00826661; UDB=6.00404899; IPR=6.00604110; 
 BA=6.00005171; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014430; XFM=3.00000011;
 UTC=2017-02-24 23:25:38
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFA52BCCD5.85369501-ON002580D1.00808B65-002580D1.0080AE00@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-02-24_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1702240219
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
X-List-Received-Date: Fri, 24 Feb 2017 23:25:43 -0000

Alistair Popple wrote on or about 02/24/2017 12:16AM in some timezone:

>On Thu, 23 Feb 2017 10:01:15 PM Brad Bishop wrote:
>> Based on what we=E2=80=99ve discussed here and a couple offline
>discussions,
>> I=E2=80=99m making some assertions below.  I=E2=80=99d like for this not=
e to be a
>> =E2=80=9Clast call for discussion=E2=80=9D (as much as that is possible)=
 so we can
>> start hacking; please try and raise any concerns by sometime next
>week.
>>
>> - sbefifo DD will implement read and write system calls.  A write
>> will put data in the upstream fifo.  A read will pull data out of
>> the downstream fifo.
>>
>> - sbefifo DD will =5Fnot=5F do any framing of data flowing into/out of
>the
>> kernel (in other words, exactly what is found in the sbei interface
>spec).
>>
>> - sbefifo will provide an in-kernel API which again, will not do
>any
>> framing of data.
>>
>> - occ-hwmon DD will assemble requests and parse responses for
>whatever
>> chip-ops it requires and use the sbefifo in-kernel api to access
>the sbe.
>>
>> - any userspace implementation of any part of the sbei spec will
>> use the sbefifo uapi.


To me, one key thing a kernel driver should be providing is resource=20
sharing.  Without finding the sbei spec, I have heard the description=20
is one outstanding op at a time, send the request and the sbe responds=20
with a response; asynchronous notifications are done by issuing a poll=20
request.

For this interface to be shared by the kernel and user programs, it=20
would seem that the write data would have to be submitted in one=20
system call and this file descriptor would be the only one that=20
could satisfy a read, and the data should be read in one system call.


If the data is just a byte stream then how can multiple users or
sources share the fifo?  Each agent would get a random response
and even with exclusive open the occ driver would have to be
stopped or paused or unbound for the user operation to occur.

Am I missing something fundamental?

milton

>>
>> Below are not assertions but relevant items yet to be resolved, and
>> should not prevent moving forward with implementation of the above.
>>
>> - Whether or not an =E2=80=98sbescom=E2=80=99 DD is valuable.  If it is,=
 it will
>> assemble requests, parse responses for whatever chip-ops it
>requires
>> and use the sbefifo in-kernel api in the same manner as the
>occ-hwmon DD.
>> imho, this feels like convenience code since we have a real hw scom
>> CFAM engine with UAPI.  A wrapper that hides this distinction could
>> just as easily be done in userspace without another DD.
>
>Thanks for taking the time to write this up! I don't have any
>concerns
>with the above summary. I agree the sbescom driver seems unneccesary
>as whether to use chip-ops or real HW scom is something that
>userspace
>(rather than the kernel) should decide anyway, so I'm not sure what
>value having that wrapper in the kernel would have.
>
>- Alistair
>
>> Thanks to everyone participating in the discussion.
>>
>> -brad
>>
>> > On Feb 22, 2017, at 12:59 PM, Alistair Popple
><alistair@popple.id.au> wrote:
>> >
>> > On Wed, 22 Feb 2017 10:53:12 PM Venkatesh Sainath wrote:
>> >
>> >> In general, I agree with this approach to contain only those
>interfaces
>> >> required by hwmon within the kernel and leave the rest to the
>> >> user-space. But, we need to interlock with the hwmon to
>understand
>> >> exactly which interfaces are required.
>> >> IMO, we need (a) Get/Put Memory for tunneling data to OCC and
>back (b)
>> >> Get/Put Scom? (c) Get/Put SRAM (?) for getting nominal voltages.
>If
>> >> these three are the right ones, then we need to contain them
>within the
>> >> kernel.
>> >
>> > Where are the OCC interfaces documented? We need to get a better
>> > understanding of these.
>> >
>> > Regardless I think you need a way for userspace to do chip-ops
>(for
>> > debug/testing/development/etc). So I guess the question is then
>which
>> > ones need a kernel implementation, and if there is a kernel
>> > implementation should userspace use that or it's own
>implementation?
>> >
>> > I think it's easiest to just have the userspace library contain
>all
>> > the neccessary chip-ops and use those. Formatting of chip-ops
>seems
>> > like it should be a trival amount of straight-forward code so the
>> > minor duplication shouldn't be a concern (especially if we leave
>> > framing up to the kernel). It's simpler than maintaining a long
>list
>> > of ioctls which would still need a userspace library imho.
>> >
>> >>>> I don't think it is a problem having get/putscom as an
>exceptional
>> >>>> case for the reasons described above. My question about the
>> >>>> consistency argument is what does it get us?
>> >>>>
>> >>>> I think Venkatesh was suggesting it would reduce duplication
>of
>> >>>> protocol driver code, however perhaps this isn't the case. We
>could
>> >>>> create a kernel chip-ops driver that deals with sending a
>buffer and
>> >>>> getting a response but doesn't have to know anything about the
>chip-op
>> >>>> itself. It could also implement the kernel sbe get/putscom.
>> >>>>
>> >>>> What I am suggesting is the chip-op driver deal with 1.1.2.4 &
>1.1.2.5
>> >>>> of the sbe interface spec. Userspace would submit
>command-class,
>> >>>> command-code & data words and the chip-ops driver would
>forward that
>> >>>> to the SBE and send the response back to userspace without
>having to
>> >>>> know what any of that data means.
>> >>> I like it!
>> >>>
>> >>> Would this =E2=80=98chip-op=E2=80=99 driver be distinct from the sbe=
fifo driver
>or
>> >>> are you proposing a possible sbefifo driver API with a tad bit
>more
>> >>> abstraction?
>> >>>
>> >>> If we did something like this, does a standalone sbescom driver
>still
>> >>> have any value?
>> >> I think the proposal is to have a combined sbefifo+sbechipop
>driver that
>> >> provides a user space api to submit operations to sbefifo and
>user space
>> >> api for those chipops contained within ( scom, memory and sram).
>The
>> >> user space library will have the other sbe interfaces and will
>call the
>> >> submit operations of the chip-op driver. Is this correct? We
>could get
>> >> the user-space library provide a wrapper interface for even the
>chip-ops
>> >> contained within the kernel so that the caller doesnt have to
>know
>> >> whether to call the library or the driver apis.
>> >>>> In any case I think you will end up with a userspace
>implementation of
>> >>>> chip-ops anyway as it is much easier to test and develop new
>chip-ops
>> >>>> without having to also understand how to build and flash a new
>kernel.
>> >>>> Inevitably someone will want to add some kind of "debug"
>chip-op or
>> >>>> other private chip-op that they don't want published in kernel
>code,
>> >>>> and as soon as you have one userspace chip-op you may as well
>do all
>> >>>> of the ones you can from there.
>> >>>>
>> >>>>>> Of course we can implement just the get/put scom chip ops in
>kernel and the others in user space.  I just want to make sure
>everyone understands exactly what we=E2=80=99d be doing there and would be=
 OK
>with that approach.
>> >>>>>>
>> >>>>>>> There's the OCC hwmon driver - what chip-ops does that
>> >>>>>>> need? Just get/putscom?
>> >>>>>> Correct, just get/putscom.  But sbe scom, not direct scom.
>> >>>>> occ hwmon driver should use get/put memory to communicate
>with OCC. One
>> >>>> What memory is the OCC using to store these buffer? Does it
>have
>> >>>> memory mapped onto the PowerBus into an MMIO space or
>something?
>> >>>>> other option ( I am not too happy about this ) is to embed
>the get/put
>> >>>>> memory protocol construction inside occ hwmon driver and make
>it call
>> >>>>> sbe fifo driver interface directly. The sbei protocol driver
>can then be
>> >>>>> in the user-space as a library and call the sbe fifo driver
>interface
>> >>>>> via ioctl. This creates duplication of the protocol driver
>code and we
>> >>>>> have to fix it in multiple places.
>> >>>>>>> If that's the case I thought we were already
>> >>>>>>> exposing scom chip-op operations via an OpenFSI master?
>> >>>>>> I have the same consistency question here.  Why is it
>preferable to have a UAPI for these chip-ops but not the others?
>> >>>>> openfsi driver is not exposing chipops. The sbe fifo driver
>must be
>> >>>>> calling the openfsi driver interfaces to write to the fifo.
>The openfsi
>> >>>>> driver must also be providing a UAPI for a non-sbe scom or
>cfam-write
>> >>>>> operations via cronus, pdbg or rest api.
>> >>>>>
>> >>>>> Net: openfsi driver need to have both intra-kernel and
>user-space APIs.
>> >>>>> sbe fifo driver also need to have both intra-kernel and
>user-space APIs
>> >>>>> if the sbei protocol driver goes to user-space.
>> >>>>>>> Regards,
>> >>>>>>>
>> >>>>>>> Alistair
>> >>>>>>>
>> >>>>>>>> thx - brad
>> >>>>>>>>
>> >>>>>>>>
>> >>>>>>>>
>> >>>>>>>>> On Feb 20, 2017, at 12:05 AM, Venkatesh Sainath
><vsainath@linux.vnet.ibm.com> wrote:
>> >>>>>>>>>
>> >>>>>>>>> Hi Brad,
>> >>>>>>>>>
>> >>>>>>>>> I am not sure why we need a user-space api for SBE FIFO
>driver. Even the pdbg and cronus apps have to go through the SBEI
>protocol driver in order to construct the packets according to the
>SBEI interface spec which is done by the SBEI protocol driver only. I
>think only an in-kernel api is sufficient for the SBE FIFO driver.
>> >>>>>>>>>
>> >>>>>>>>> However, for the SBEI protocol driver, we would need both
>in-kernel ( for use by OCC hwmon ) and user-space api ( for use by
>pdbg, cronus and rest apis ).
>> >>>>>>>>>
>> >>>>>>>>> Thanks
>> >>>>>>>>>
>> >>>>>>>>> With regards
>> >>>>>>>>> Venkatesh
>> >>>>>>>>>
>> >>>>>>>>> On 20/02/17 8:17 AM, Brad Bishop wrote:
>> >>>>>>>>>> Thanks Jeremy for the reply.  I=E2=80=99ve added participants
>from this thread:
>> >>>>>>>>>>
>> >>>>>>>>>>
>https://lists.ozlabs.org/pipermail/openbmc/2017-February/006563.html
>> >>>>>>>>>>
>> >>>>>>>>>> in an attempt to consolidate the whole sbefifo design
>discussion to a single thread.
>> >>>>>>>>>>
>> >>>>>>>>>>> Hi Brad,
>> >>>>>>>>>>>
>> >>>>>>>>>>>> Looking to start a discussion around possible user
>space and kernel
>> >>>>>>>>>>>> APIs for the POWER9 sbefifo driver.
>> >>>>>>>>>>>>
>> >>>>>>>>>>>> There exists today an =E2=80=9Calternate" sbefifo driver :-)
>that provides a
>> >>>>>>>>>>>> single submit ioctl.  Applications submit a request
>and get a reply in
>> >>>>>>>>>>>> single system call.
>> >>>>>>>>>>>>
>> >>>>>>>>>>>> Is something like that the best approach for an
>upstream driver?  Or
>> >>>>>>>>>>>> should we try something more "pipe like" with
>read/write interfaces?
>> >>>>>>>>>>> It probably depends on the functionality there; ioctl()
>is useful in
>> >>>>>>>>>>> that (as you say) we can handle request and response in
>a single
>> >>>>>>>>>>> syscall, read() / write() may be more appropriate if
>ordering can be
>> >>>>>>>>>>> handled in userspace.
>> >>>>>>>>>>>
>> >>>>>>>>>>> Can you add a little description about the
>functionality we're exposing?
>> >>>>>>>>>>> That may suggest a particular API.
>> >>>>>>>>>> In terms of hardware its pretty simple.  sbefifo is just
>two 8-word queues for sending/receiving messages to/from the SBE.
>Each queue entry has a single =E2=80=98end of transfer=E2=80=99 flag to le=
t the other
>side know the message is done.
>> >>>>>>>>>>
>> >>>>>>>>>> In terms of data flowing through it, there is an SBEI
>protocol that covers encoding operations (like getscom, getmem, etc..
>aka chip-ops) and the SBE response.
>> >>>>>>>>>>
>> >>>>>>>>>> For users there seems to be two classes:
>> >>>>>>>>>>
>> >>>>>>>>>> 1 - user space wanting to do chip-ops (pdbg, cronus).
>> >>>>>>>>>> 2 - device drivers wanting to do chip-ops (occ-hwmon).
>> >>>>>>>>>>
>> >>>>>>>>>> If it weren=E2=80=99t for occ-hwmon, it doesn=E2=80=99t seem =
like there
>would be any need for the kernel to have any knowledge of the data
>flowing through the fifo (at the moment anyway).  An sbe-scom driver
>has been suggested but I wonder what the point of that driver would
>be, if userspace could simply encode a get/putscom chip-op and use
>the fifo directly.
>> >>>>>>>>>>
>> >>>>>>>>>>>> Would the in-kernel API be the same as the user space
>API?
>> >>>>>>>>>>> Probably not :)
>> >>>>>>>>>> I realize they wouldn=E2=80=99t be =5Fexactly=5F the same if =
thats
>why I got the smiley face :-) ...
>> >>>>>>>>>>
>> >>>>>>>>>> But I would have figured they=E2=80=99d at least be similar -
>meaning if we were go the =E2=80=98submit=E2=80=99 route for a UAPI..the k=
ernel
>> >>>>>>>>>> would probably not have a split read/write API or vise
>versa.
>> >>>>>>>>>>
>> >>>>>>>>>> So to rephrase the question - would the chardev fops
>implementation simply be something like this:
>> >>>>>>>>>>
>> >>>>>>>>>> sbe-uapi-fops(chardev)
>> >>>>>>>>>>   data =3D copy to/from user space;
>> >>>>>>>>>>   sbedev =3D from=5Fchardev(chardev);
>> >>>>>>>>>>   kernel-api(sbedev, data);
>> >>>>>>>>>>
>> >>>>>>>>>> Or are the other things to consider here?
>> >>>>>>>>>>
>> >>>>>>>>>> -thx
>> >>>>>>>>>>
>> >>>>>>>>>> brad
>> >>>>>>>>>>
>> >>>>>>>>>>> Cheers,
>> >>>>>>>>>>>
>> >>>>>>>>>>>
>> >>>>>>>>>>> Jeremy
>> >>
>
>
