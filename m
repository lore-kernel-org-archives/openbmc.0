Return-Path: <anoo@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yBV146v5bzDqlv
 for <openbmc@lists.ozlabs.org>; Wed, 11 Oct 2017 08:02:16 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9AL0h0b026645
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 17:02:14 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dh3k46m32-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 10 Oct 2017 17:02:13 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.vnet.ibm.com>;
 Tue, 10 Oct 2017 15:02:13 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 10 Oct 2017 15:02:09 -0600
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9AL299I6226408; Tue, 10 Oct 2017 14:02:09 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CEFC78047;
 Tue, 10 Oct 2017 15:02:09 -0600 (MDT)
Received: from adriana-mbp.austin.ibm.com (unknown [9.53.179.190])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS id 7CE4B78038;
 Tue, 10 Oct 2017 15:02:08 -0600 (MDT)
From: Adriana Kobylak <anoo@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_7AD270B5-A458-4A71-89DD-4A3AFBE67C3A"
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [RFC] docs: Specify V3 of the mbox protocol
Date: Tue, 10 Oct 2017 15:59:58 -0500
In-Reply-To: <CAPnigKnAeB9_neipwB5BPHXLSHMMWsNYLTxZe6f9fXxJvrudGg@mail.gmail.com>
Cc: Suraj Jitindar Singh <sjitindarsingh@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, skiboot@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, stewart@linux.vnet.ibm.com, cyrilbur@gmail.com
To: William Kennington <wak@google.com>
References: <20170907071409.7163-1-sjitindarsingh@gmail.com>
 <20170907071409.7163-2-sjitindarsingh@gmail.com>
 <1505113305.4080.1.camel@aj.id.au> <1505189782.2222.1.camel@gmail.com>
 <1505354227.4080.11.camel@aj.id.au> <1505796357.30609.1.camel@gmail.com>
 <1507004777.2329.1.camel@gmail.com>
 <CAPnigKnAeB9_neipwB5BPHXLSHMMWsNYLTxZe6f9fXxJvrudGg@mail.gmail.com>
X-Mailer: Apple Mail (2.3273)
X-TM-AS-GCONF: 00
x-cbid: 17101021-0008-0000-0000-000008B1969C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007874; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00929270; UDB=6.00467703; IPR=6.00709541; 
 BA=6.00005632; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017481; XFM=3.00000015;
 UTC=2017-10-10 21:02:11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17101021-0009-0000-0000-0000444EEB8C
Message-Id: <1C77CFF2-D774-4216-85F8-26736DE58BB9@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-10_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710100299
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Oct 2017 21:02:17 -0000


--Apple-Mail=_7AD270B5-A458-4A71-89DD-4A3AFBE67C3A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Acked-by: Adriana Kobylak <anoo@us.ibm <mailto:anoo@us.ibm>.com>


> On Oct 3, 2017, at 12:39 PM, William Kennington <wak@google.com> =
wrote:
>=20
> Yeah, go ahead and change it to that
>=20
> On Mon, Oct 2, 2017 at 9:26 PM Suraj Jitindar Singh =
<sjitindarsingh@gmail.com <mailto:sjitindarsingh@gmail.com>> wrote:
> @wak ping,
>=20
> Thoughts on using the first arg in the response of get flash name as a
> length argument?
>=20
> On Tue, 2017-09-19 at 14:45 +1000, Suraj Jitindar Singh wrote:
> > @wak:
> >
> > As per Andrews suggestion below, how do you feel about making the
> > first
> > arg in the response for get flash name the length?
> >
> > @andrew:
> >
> > Since your comments regarding flash integrity aren't really relevant
> > at
> > the protocol level do you think it's something which needs to be
> > mentioned in this document or is just common sense (unless you're me
> > and didn't implement it that way :p)...
> >
> > On Thu, 2017-09-14 at 11:27 +0930, Andrew Jeffery wrote:
> > > > > > +The host may lock an area of flash using the MARK_LOCKED
> > > > > > command.
> > > > > > Any attempt
> > > > > > +to mark dirty or erased this area of flash must fail with
> > > > > > the
> > > > > > LOCKED_ERROR
> > > > > > +response code. The host may open a write window which
> > > > > > contains
> > > > > > a
> > > > > > locked area
> > > > > > +of flash however changes to a locked area of flash must
> > > > > > never
> > > > > > be
> > > > > > written back
> > > > > > +to the backing data source (i.e. that area of flash must be
> > > > > > treated as read
> > > > > > +only). An attempt to lock an area of flash which is not
> > > > > > clean
> > > > > > in
> > > > > > the current
> > > > > > +window must fail with PARAM_ERROR. (V3)
> > > > >
> > > > > I think we need to consider how locked regions interact with
> > > > > the
> > > > > in-
> > > > > memory
> > > > > caching of the flash data.
> > > > >
> > > > > The BMC doesn't know that the memory backing the LPC window =
has
> > > > > been
> > > > > written until it receives a MARK_DIRTY from the host.
> > > > > MARK_DIRTY
> > > > > is
> > > > > not
> > > > > valid on a read window or a locked region, but that doesn't
> > > > > mean
> > > > > that
> > > > > changes to a locked region can't persist in memory due to
> > > > > caching
> > > > > to
> > > > > avoid flash access (which was a part of the motivation for
> > > > > memory-
> > > > > based=20
> > > > > booting to begin with). This may naively fool host firmware
> > > > > into
> > > > > thinking it is
> > > > > accessing unmolested data as the region is locked, whereas the
> > > > > region
> > > > > could
> > > > > contain anything, just it will never be written to flash.
> > > >
> > > > Correct
> > > >
> > > > >
> > > > > Should we require window requests intersecting a locked region
> > > > > always
> > > > > have at
> > > > > least the locked region positively match the on-flash data?
> > > > > That
> > > > > way
> > > > > the
> > > > > firmware that requested a region be locked could ensure it has
> > > > > whatever was on
> > > > > the flash at the time it was locked by explicitly closing the
> > > > > window
> > > > > (read or
> > > > > write) once finished with it, which requires a window be =
opened
> > > > > again
> > > > > for any
> > > > > subsequent access. At that point (open) we can do the locked
> > > > > region
> > > > > intesection
> > > > > calculation and check the data in the window as necessary.
> > > >
> > > > I guess this brings about an interesting question, when a window
> > > > is
> > > > requested is it guaranteed that the window provided in return by
> > > > the
> > > > BMC contains the same contents as the flash for the requested
> > > > area?
> > >
> > > I think expecting otherwise would be strange. What way would the
> > > host
> > > have to validate that? It could keep its own hashes of window
> > > content,
> > > but it would need to hash the content itself after opening the
> > > window
> > > which may be a circular problem (e.g. host reboot if the daemon
> > > doesn't
> > > invalidate the cache across the reboot operation).
> > >
> > > >  It
> > > > would seem intuitively that it should. The first time a window =
is
> > > > opened that is true, but with in memory caching the host could
> > > > make
> > > > a
> > > > change that it never tells the bmc about and the contents
> > > > diverge,
> > > > and
> > > > (assuming the window isn't evicted) persist across window
> > > > close/open
> > > > calls.
> > >
> > > Yep.
> > >
> > > >
> > > > Is this the desired behaviour?=20
> > >
> > > No, not in my opinion. It doesn't fit the principle of least
> > > surprise.
> > >
> > > > It's kind of the only behaviour which
> > > > makes the in-memory caching an effective performance =
improvement,
> > > > if we
> > > > reloaded every window every time then we may as well only have
> > > > one
> > > > window in memory anyway. Maybe we can do this a better way (see
> > > > below).
> > > >
> > > > It's worth noting that the current flash locking daemon
> > > > implementation
> > > > will explicitly reload an entire window whenever one which
> > > > contains
> > > > any
> > > > locked regions is requested - ensuring (for at least as long as
> > > > the
> > > > access to the flash device is exclusive) the integrity of the
> > > > locked
> > > > regions. This could of course be optimised to only reload the
> > > > locked
> > > > region.
> > >
> > > Right, and if we take up the techniques discussed below we may =
even
> > > be
> > > able to eliminate that.
> > >
> > > >
> > > > >
> > > > > Locked regions could thus be a performance hit if we always
> > > > > load
> > > > > the
> > > > > locked
> > > > > regions from flash, but surely we prefer (some) integrity over
> > > > > performance.
> > > > >
> > > > > Alternatively, you could cryptographically hash the per-block
> > > > > content
> > > > > of the
> > > > > on-flash locked region during the MARK_LOCKED operation, then
> > > > > stash
> > > > > the hash
> > > > > values away. On a CREATE_{READ,WRITE}_WINDOW operation you
> > > > > could
> > > > > hash
> > > > > any
> > > > > intersecting, in-cache locked blocks and compare to the =
stashed
> > > > > hash
> > > > > values to
> > > > > incur only one set of flash accesses (initial hash
> > > > > calculations)
> > > > > rather than n.
> > > >
> > > > This seems like a nice balance between performance and data
> > > > integrity.
> > > >
> > > > I guess this brings about the question again as to whether we
> > > > care
> > > > about data changes we aren't told about. Do we store a hash of
> > > > every
> > > > window and before providing a cached copy verify the hash and
> > > > reload
> > > > the entire window from flash again if there is a discrepancy. =
The
> > > > host
> > > > isn't allowed to rely on the persistence of data it never tells
> > > > the
> > > > BMC
> > > > about, but is this something the BMC should be checking?
> > >
> > > I think so, again in support of the principle of least surprise,
> > > and
> > > the possible security implications. I proposed verifying the
> > > integrity
> > > of only the locked regions but it might be worth extending that to
> > > entire windows depending on the performance. We should do some
> > > measurements.
> > >
> > > I think implementations also need to be noisy in the case of a
> > > discrepancy, logging on the BMC side and possibly issuing a BMC
> > > Event
> > > (taking another one of our reserved bits for the purpose). The
> > > modifications are pretty much limited to accidental scribbling
> > > (bugs),
> > > or malicious intent (probably enabled by more bugs). Either way,
> > > someone should be notified.
> > >
> > > > > > +Command:
> > > > > > > > > +       GET_FLASH_NAME (V3)
> > > > > > > > > +       Arguments:
> > > > > > > > > +               Args 0: Flash ID
> > > > > > > > > +       Response:
> > > > > >
> > > > > > +             Args 0-10: Flash Name / UID
> > > > >
> > > > > Hopefully 11 bytes is enough. Well, 10 I guess - should we
> > > > > specify
> > > > > that the
> > > > > value at index 10 be '\0'? I feel like not requiring that =
could
> > > > > lead
> > > > > to
> > > > > undesirable implementations.
> > > >
> > > > Depends on whether we require names be 11 bytes, be null
> > > > terminated, or
> > > > just contain trailing nulls for names shorter than 11 bytes.
> > > >
> > > > If we're going to waste an argument on the null terminator we =
may
> > > > as
> > > > well just make the first argument the length of the name.
> > >
> > > I think that's a better idea generally. It doesn't assume C-string
> > > semantics, though it's likely that the implementations will =
require
> > > them, which was what I was looking out for.
> > >
> > > >
> > > > Is this something the protocol should care about. Maybe it's =
just
> > > > up to
> > > > the daemon and host implementation to put something here that
> > > > they
> > > > both
> > > > understand.
> > >
> > > Probably not, it was just a thought. It's a balance against
> > > avoiding
> > > potential vulnerabilities and over-specifying behaviour.
> > >
> > > >
> > > > >
> > > > > I guess we don't want to go down the path of continued
> > > > > responses
> > > > > or
> > > > > magic
> > > > > windows to accommodate larger names?
> > > >
> > > > I'd prefer not :)
> > > >
> > >
> > > Same :) Just throwing the question out there for discussion
> > >
> > > > >
> > > > > > > > > +       Notes:
> > > > > > > > > +               Describes a flash with some kind of
> > > > > > > > > identifier
> > > > > >
> > > > > > useful to the
> > > > > > > > > +               host system. This is typically a null-
> > > > > > > > > padded
> > > > > >
> > > > > > string.
> > > > > > +
> > > > > > +Command:
> > > > > > > > > +       MARK_LOCKED (V3)
> > > > > > > > > +       Arguments:
> > > > > > > > > +               Args 0-1: Flash offset to lock
> > > > > > > > > (blocks)
> > > > > >
> > > > > > +             Args 2-3: Number to lock at offset (blocks)
> > > > >
> > > > > I guess it's hard to get away from using block-sized
> > > > > granuality.
> > > > > Do
> > > > > we
> > > > > currently have any partitions that we might lock that are less
> > > > > than a
> > > > > block
> > > > > size? Or are all partitions expected to be block-size aligned?
> > > >
> > > > This was the motivation for allowing the host to request a block
> > > > size,
> > > > so that they can hopefully request something which allows =
locking
> > > > at
> > > > the required granularity. Currently all partitions are aligned =
to
> > > > flash
> > > > erase size (which is what we set block size to anyway).
> > >
> > > Okay. It might be worth making a note in the documentation for
> > > MBOX_GET_INFO saying as much.
> > >
> > > >
> > > > It's not really worth allowing locking at a finer granularity
> > > > than
> > > > block size since this is how changes (mark dirty) are specified
> > > > and
> > > > so
> > > > it would be impossible to write back any part of a block if a
> > > > single
> > > > byte in that block were locked. I'm in favour of using block =
size
> > > > for
> > > > now and changing it in a later version if this becomes an issue.
> > >
> > > Right, it's either blocks for everything or bytes for everything.
> > > Consistency is good. I don't think we want to go through the =
effort
> > > of
> > > changing that aspect of the spec right now.
> > >
> > > Cheers,
> > >
> > > Andrew


--Apple-Mail=_7AD270B5-A458-4A71-89DD-4A3AFBE67C3A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><span style=3D"font-family: ArialUnicodeMS;" =
class=3D"">Acked-by: Adriana Kobylak &lt;</span><a =
href=3D"mailto:anoo@us.ibm" class=3D""><font face=3D"ArialUnicodeMS" =
class=3D"">anoo@u</font>s.ibm</a>.com<span style=3D"font-family: =
ArialUnicodeMS;" class=3D"">&gt;</span><div class=3D""><font =
face=3D"ArialUnicodeMS" class=3D""><br class=3D""></font></div><div =
class=3D""><font face=3D"ArialUnicodeMS" class=3D""><br =
class=3D""></font><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Oct 3, 2017, at 12:39 PM, William Kennington &lt;<a =
href=3D"mailto:wak@google.com" class=3D"">wak@google.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><div class=3D""><div =
dir=3D"ltr" class=3D"">Yeah, go ahead and change it to that</div><br =
class=3D""><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"">On =
Mon, Oct 2, 2017 at 9:26 PM Suraj Jitindar Singh &lt;<a =
href=3D"mailto:sjitindarsingh@gmail.com" =
class=3D"">sjitindarsingh@gmail.com</a>&gt; wrote:<br =
class=3D""></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">@wak ping,<br =
class=3D"">
<br class=3D"">
Thoughts on using the first arg in the response of get flash name as =
a<br class=3D"">
length argument?<br class=3D"">
<br class=3D"">
On Tue, 2017-09-19 at 14:45 +1000, Suraj Jitindar Singh wrote:<br =
class=3D"">
&gt; @wak:<br class=3D"">
&gt;<br class=3D"">
&gt; As per Andrews suggestion below, how do you feel about making =
the<br class=3D"">
&gt; first<br class=3D"">
&gt; arg in the response for get flash name the length?<br class=3D"">
&gt;<br class=3D"">
&gt; @andrew:<br class=3D"">
&gt;<br class=3D"">
&gt; Since your comments regarding flash integrity aren't really =
relevant<br class=3D"">
&gt; at<br class=3D"">
&gt; the protocol level do you think it's something which needs to be<br =
class=3D"">
&gt; mentioned in this document or is just common sense (unless you're =
me<br class=3D"">
&gt; and didn't implement it that way :p)...<br class=3D"">
&gt;<br class=3D"">
&gt; On Thu, 2017-09-14 at 11:27 +0930, Andrew Jeffery wrote:<br =
class=3D"">
&gt; &gt; &gt; &gt; &gt; +The host may lock an area of flash using the =
MARK_LOCKED<br class=3D"">
&gt; &gt; &gt; &gt; &gt; command.<br class=3D"">
&gt; &gt; &gt; &gt; &gt; Any attempt<br class=3D"">
&gt; &gt; &gt; &gt; &gt; +to mark dirty or erased this area of flash =
must fail with<br class=3D"">
&gt; &gt; &gt; &gt; &gt; the<br class=3D"">
&gt; &gt; &gt; &gt; &gt; LOCKED_ERROR<br class=3D"">
&gt; &gt; &gt; &gt; &gt; +response code. The host may open a write =
window which<br class=3D"">
&gt; &gt; &gt; &gt; &gt; contains<br class=3D"">
&gt; &gt; &gt; &gt; &gt; a<br class=3D"">
&gt; &gt; &gt; &gt; &gt; locked area<br class=3D"">
&gt; &gt; &gt; &gt; &gt; +of flash however changes to a locked area of =
flash must<br class=3D"">
&gt; &gt; &gt; &gt; &gt; never<br class=3D"">
&gt; &gt; &gt; &gt; &gt; be<br class=3D"">
&gt; &gt; &gt; &gt; &gt; written back<br class=3D"">
&gt; &gt; &gt; &gt; &gt; +to the backing data source (i.e. that area of =
flash must be<br class=3D"">
&gt; &gt; &gt; &gt; &gt; treated as read<br class=3D"">
&gt; &gt; &gt; &gt; &gt; +only). An attempt to lock an area of flash =
which is not<br class=3D"">
&gt; &gt; &gt; &gt; &gt; clean<br class=3D"">
&gt; &gt; &gt; &gt; &gt; in<br class=3D"">
&gt; &gt; &gt; &gt; &gt; the current<br class=3D"">
&gt; &gt; &gt; &gt; &gt; +window must fail with PARAM_ERROR. (V3)<br =
class=3D"">
&gt; &gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; &gt; I think we need to consider how locked regions =
interact with<br class=3D"">
&gt; &gt; &gt; &gt; the<br class=3D"">
&gt; &gt; &gt; &gt; in-<br class=3D"">
&gt; &gt; &gt; &gt; memory<br class=3D"">
&gt; &gt; &gt; &gt; caching of the flash data.<br class=3D"">
&gt; &gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; &gt; The BMC doesn't know that the memory backing the LPC =
window has<br class=3D"">
&gt; &gt; &gt; &gt; been<br class=3D"">
&gt; &gt; &gt; &gt; written until it receives a MARK_DIRTY from the =
host.<br class=3D"">
&gt; &gt; &gt; &gt; MARK_DIRTY<br class=3D"">
&gt; &gt; &gt; &gt; is<br class=3D"">
&gt; &gt; &gt; &gt; not<br class=3D"">
&gt; &gt; &gt; &gt; valid on a read window or a locked region, but that =
doesn't<br class=3D"">
&gt; &gt; &gt; &gt; mean<br class=3D"">
&gt; &gt; &gt; &gt; that<br class=3D"">
&gt; &gt; &gt; &gt; changes to a locked region can't persist in memory =
due to<br class=3D"">
&gt; &gt; &gt; &gt; caching<br class=3D"">
&gt; &gt; &gt; &gt; to<br class=3D"">
&gt; &gt; &gt; &gt; avoid flash access (which was a part of the =
motivation for<br class=3D"">
&gt; &gt; &gt; &gt; memory-<br class=3D"">
&gt; &gt; &gt; &gt; based&nbsp;<br class=3D"">
&gt; &gt; &gt; &gt; booting to begin with). This may naively fool host =
firmware<br class=3D"">
&gt; &gt; &gt; &gt; into<br class=3D"">
&gt; &gt; &gt; &gt; thinking it is<br class=3D"">
&gt; &gt; &gt; &gt; accessing unmolested data as the region is locked, =
whereas the<br class=3D"">
&gt; &gt; &gt; &gt; region<br class=3D"">
&gt; &gt; &gt; &gt; could<br class=3D"">
&gt; &gt; &gt; &gt; contain anything, just it will never be written to =
flash.<br class=3D"">
&gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; Correct<br class=3D"">
&gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; &gt; Should we require window requests intersecting a =
locked region<br class=3D"">
&gt; &gt; &gt; &gt; always<br class=3D"">
&gt; &gt; &gt; &gt; have at<br class=3D"">
&gt; &gt; &gt; &gt; least the locked region positively match the =
on-flash data?<br class=3D"">
&gt; &gt; &gt; &gt; That<br class=3D"">
&gt; &gt; &gt; &gt; way<br class=3D"">
&gt; &gt; &gt; &gt; the<br class=3D"">
&gt; &gt; &gt; &gt; firmware that requested a region be locked could =
ensure it has<br class=3D"">
&gt; &gt; &gt; &gt; whatever was on<br class=3D"">
&gt; &gt; &gt; &gt; the flash at the time it was locked by explicitly =
closing the<br class=3D"">
&gt; &gt; &gt; &gt; window<br class=3D"">
&gt; &gt; &gt; &gt; (read or<br class=3D"">
&gt; &gt; &gt; &gt; write) once finished with it, which requires a =
window be opened<br class=3D"">
&gt; &gt; &gt; &gt; again<br class=3D"">
&gt; &gt; &gt; &gt; for any<br class=3D"">
&gt; &gt; &gt; &gt; subsequent access. At that point (open) we can do =
the locked<br class=3D"">
&gt; &gt; &gt; &gt; region<br class=3D"">
&gt; &gt; &gt; &gt; intesection<br class=3D"">
&gt; &gt; &gt; &gt; calculation and check the data in the window as =
necessary.<br class=3D"">
&gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; I guess this brings about an interesting question, when a =
window<br class=3D"">
&gt; &gt; &gt; is<br class=3D"">
&gt; &gt; &gt; requested is it guaranteed that the window provided in =
return by<br class=3D"">
&gt; &gt; &gt; the<br class=3D"">
&gt; &gt; &gt; BMC contains the same contents as the flash for the =
requested<br class=3D"">
&gt; &gt; &gt; area?<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; I think expecting otherwise would be strange. What way would =
the<br class=3D"">
&gt; &gt; host<br class=3D"">
&gt; &gt; have to validate that? It could keep its own hashes of =
window<br class=3D"">
&gt; &gt; content,<br class=3D"">
&gt; &gt; but it would need to hash the content itself after opening =
the<br class=3D"">
&gt; &gt; window<br class=3D"">
&gt; &gt; which may be a circular problem (e.g. host reboot if the =
daemon<br class=3D"">
&gt; &gt; doesn't<br class=3D"">
&gt; &gt; invalidate the cache across the reboot operation).<br =
class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; &gt; &nbsp;It<br class=3D"">
&gt; &gt; &gt; would seem intuitively that it should. The first time a =
window is<br class=3D"">
&gt; &gt; &gt; opened that is true, but with in memory caching the host =
could<br class=3D"">
&gt; &gt; &gt; make<br class=3D"">
&gt; &gt; &gt; a<br class=3D"">
&gt; &gt; &gt; change that it never tells the bmc about and the =
contents<br class=3D"">
&gt; &gt; &gt; diverge,<br class=3D"">
&gt; &gt; &gt; and<br class=3D"">
&gt; &gt; &gt; (assuming the window isn't evicted) persist across =
window<br class=3D"">
&gt; &gt; &gt; close/open<br class=3D"">
&gt; &gt; &gt; calls.<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; Yep.<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; Is this the desired behaviour?&nbsp;<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; No, not in my opinion. It doesn't fit the principle of =
least<br class=3D"">
&gt; &gt; surprise.<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; &gt; It's kind of the only behaviour which<br class=3D"">
&gt; &gt; &gt; makes the in-memory caching an effective performance =
improvement,<br class=3D"">
&gt; &gt; &gt; if we<br class=3D"">
&gt; &gt; &gt; reloaded every window every time then we may as well only =
have<br class=3D"">
&gt; &gt; &gt; one<br class=3D"">
&gt; &gt; &gt; window in memory anyway. Maybe we can do this a better =
way (see<br class=3D"">
&gt; &gt; &gt; below).<br class=3D"">
&gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; It's worth noting that the current flash locking =
daemon<br class=3D"">
&gt; &gt; &gt; implementation<br class=3D"">
&gt; &gt; &gt; will explicitly reload an entire window whenever one =
which<br class=3D"">
&gt; &gt; &gt; contains<br class=3D"">
&gt; &gt; &gt; any<br class=3D"">
&gt; &gt; &gt; locked regions is requested - ensuring (for at least as =
long as<br class=3D"">
&gt; &gt; &gt; the<br class=3D"">
&gt; &gt; &gt; access to the flash device is exclusive) the integrity of =
the<br class=3D"">
&gt; &gt; &gt; locked<br class=3D"">
&gt; &gt; &gt; regions. This could of course be optimised to only reload =
the<br class=3D"">
&gt; &gt; &gt; locked<br class=3D"">
&gt; &gt; &gt; region.<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; Right, and if we take up the techniques discussed below we may =
even<br class=3D"">
&gt; &gt; be<br class=3D"">
&gt; &gt; able to eliminate that.<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; &gt; Locked regions could thus be a performance hit if we =
always<br class=3D"">
&gt; &gt; &gt; &gt; load<br class=3D"">
&gt; &gt; &gt; &gt; the<br class=3D"">
&gt; &gt; &gt; &gt; locked<br class=3D"">
&gt; &gt; &gt; &gt; regions from flash, but surely we prefer (some) =
integrity over<br class=3D"">
&gt; &gt; &gt; &gt; performance.<br class=3D"">
&gt; &gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; &gt; Alternatively, you could cryptographically hash the =
per-block<br class=3D"">
&gt; &gt; &gt; &gt; content<br class=3D"">
&gt; &gt; &gt; &gt; of the<br class=3D"">
&gt; &gt; &gt; &gt; on-flash locked region during the MARK_LOCKED =
operation, then<br class=3D"">
&gt; &gt; &gt; &gt; stash<br class=3D"">
&gt; &gt; &gt; &gt; the hash<br class=3D"">
&gt; &gt; &gt; &gt; values away. On a CREATE_{READ,WRITE}_WINDOW =
operation you<br class=3D"">
&gt; &gt; &gt; &gt; could<br class=3D"">
&gt; &gt; &gt; &gt; hash<br class=3D"">
&gt; &gt; &gt; &gt; any<br class=3D"">
&gt; &gt; &gt; &gt; intersecting, in-cache locked blocks and compare to =
the stashed<br class=3D"">
&gt; &gt; &gt; &gt; hash<br class=3D"">
&gt; &gt; &gt; &gt; values to<br class=3D"">
&gt; &gt; &gt; &gt; incur only one set of flash accesses (initial =
hash<br class=3D"">
&gt; &gt; &gt; &gt; calculations)<br class=3D"">
&gt; &gt; &gt; &gt; rather than n.<br class=3D"">
&gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; This seems like a nice balance between performance and =
data<br class=3D"">
&gt; &gt; &gt; integrity.<br class=3D"">
&gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; I guess this brings about the question again as to =
whether we<br class=3D"">
&gt; &gt; &gt; care<br class=3D"">
&gt; &gt; &gt; about data changes we aren't told about. Do we store a =
hash of<br class=3D"">
&gt; &gt; &gt; every<br class=3D"">
&gt; &gt; &gt; window and before providing a cached copy verify the hash =
and<br class=3D"">
&gt; &gt; &gt; reload<br class=3D"">
&gt; &gt; &gt; the entire window from flash again if there is a =
discrepancy. The<br class=3D"">
&gt; &gt; &gt; host<br class=3D"">
&gt; &gt; &gt; isn't allowed to rely on the persistence of data it never =
tells<br class=3D"">
&gt; &gt; &gt; the<br class=3D"">
&gt; &gt; &gt; BMC<br class=3D"">
&gt; &gt; &gt; about, but is this something the BMC should be =
checking?<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; I think so, again in support of the principle of least =
surprise,<br class=3D"">
&gt; &gt; and<br class=3D"">
&gt; &gt; the possible security implications. I proposed verifying =
the<br class=3D"">
&gt; &gt; integrity<br class=3D"">
&gt; &gt; of only the locked regions but it might be worth extending =
that to<br class=3D"">
&gt; &gt; entire windows depending on the performance. We should do =
some<br class=3D"">
&gt; &gt; measurements.<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; I think implementations also need to be noisy in the case of =
a<br class=3D"">
&gt; &gt; discrepancy, logging on the BMC side and possibly issuing a =
BMC<br class=3D"">
&gt; &gt; Event<br class=3D"">
&gt; &gt; (taking another one of our reserved bits for the purpose). =
The<br class=3D"">
&gt; &gt; modifications are pretty much limited to accidental =
scribbling<br class=3D"">
&gt; &gt; (bugs),<br class=3D"">
&gt; &gt; or malicious intent (probably enabled by more bugs). Either =
way,<br class=3D"">
&gt; &gt; someone should be notified.<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; &gt; &gt; &gt; +Command:<br class=3D"">
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +&nbsp; &nbsp; &nbsp; =
&nbsp;GET_FLASH_NAME (V3)<br class=3D"">
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +&nbsp; &nbsp; &nbsp; =
&nbsp;Arguments:<br class=3D"">
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;Args 0: Flash ID<br class=3D"">
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +&nbsp; &nbsp; &nbsp; =
&nbsp;Response:<br class=3D"">
&gt; &gt; &gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; &gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;Args 0-10: Flash Name / UID<br class=3D"">
&gt; &gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; &gt; Hopefully 11 bytes is enough. Well, 10 I guess - =
should we<br class=3D"">
&gt; &gt; &gt; &gt; specify<br class=3D"">
&gt; &gt; &gt; &gt; that the<br class=3D"">
&gt; &gt; &gt; &gt; value at index 10 be '\0'? I feel like not requiring =
that could<br class=3D"">
&gt; &gt; &gt; &gt; lead<br class=3D"">
&gt; &gt; &gt; &gt; to<br class=3D"">
&gt; &gt; &gt; &gt; undesirable implementations.<br class=3D"">
&gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; Depends on whether we require names be 11 bytes, be =
null<br class=3D"">
&gt; &gt; &gt; terminated, or<br class=3D"">
&gt; &gt; &gt; just contain trailing nulls for names shorter than 11 =
bytes.<br class=3D"">
&gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; If we're going to waste an argument on the null =
terminator we may<br class=3D"">
&gt; &gt; &gt; as<br class=3D"">
&gt; &gt; &gt; well just make the first argument the length of the =
name.<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; I think that's a better idea generally. It doesn't assume =
C-string<br class=3D"">
&gt; &gt; semantics, though it's likely that the implementations will =
require<br class=3D"">
&gt; &gt; them, which was what I was looking out for.<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; Is this something the protocol should care about. Maybe =
it's just<br class=3D"">
&gt; &gt; &gt; up to<br class=3D"">
&gt; &gt; &gt; the daemon and host implementation to put something here =
that<br class=3D"">
&gt; &gt; &gt; they<br class=3D"">
&gt; &gt; &gt; both<br class=3D"">
&gt; &gt; &gt; understand.<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; Probably not, it was just a thought. It's a balance against<br =
class=3D"">
&gt; &gt; avoiding<br class=3D"">
&gt; &gt; potential vulnerabilities and over-specifying behaviour.<br =
class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; &gt; I guess we don't want to go down the path of =
continued<br class=3D"">
&gt; &gt; &gt; &gt; responses<br class=3D"">
&gt; &gt; &gt; &gt; or<br class=3D"">
&gt; &gt; &gt; &gt; magic<br class=3D"">
&gt; &gt; &gt; &gt; windows to accommodate larger names?<br class=3D"">
&gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; I'd prefer not :)<br class=3D"">
&gt; &gt; &gt;<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; Same :) Just throwing the question out there for discussion<br =
class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +&nbsp; &nbsp; &nbsp; =
&nbsp;Notes:<br class=3D"">
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;Describes a flash with some kind of<br =
class=3D"">
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; identifier<br class=3D"">
&gt; &gt; &gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; &gt; &gt; useful to the<br class=3D"">
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;host system. This is typically a null-<br =
class=3D"">
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; padded<br class=3D"">
&gt; &gt; &gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; &gt; &gt; string.<br class=3D"">
&gt; &gt; &gt; &gt; &gt; +<br class=3D"">
&gt; &gt; &gt; &gt; &gt; +Command:<br class=3D"">
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +&nbsp; &nbsp; &nbsp; =
&nbsp;MARK_LOCKED (V3)<br class=3D"">
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +&nbsp; &nbsp; &nbsp; =
&nbsp;Arguments:<br class=3D"">
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;Args 0-1: Flash offset to lock<br class=3D"">
&gt; &gt; &gt; &gt; &gt; &gt; &gt; &gt; (blocks)<br class=3D"">
&gt; &gt; &gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; &gt; &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;Args 2-3: Number to lock at offset (blocks)<br class=3D"">
&gt; &gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; &gt; I guess it's hard to get away from using =
block-sized<br class=3D"">
&gt; &gt; &gt; &gt; granuality.<br class=3D"">
&gt; &gt; &gt; &gt; Do<br class=3D"">
&gt; &gt; &gt; &gt; we<br class=3D"">
&gt; &gt; &gt; &gt; currently have any partitions that we might lock =
that are less<br class=3D"">
&gt; &gt; &gt; &gt; than a<br class=3D"">
&gt; &gt; &gt; &gt; block<br class=3D"">
&gt; &gt; &gt; &gt; size? Or are all partitions expected to be =
block-size aligned?<br class=3D"">
&gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; This was the motivation for allowing the host to request =
a block<br class=3D"">
&gt; &gt; &gt; size,<br class=3D"">
&gt; &gt; &gt; so that they can hopefully request something which allows =
locking<br class=3D"">
&gt; &gt; &gt; at<br class=3D"">
&gt; &gt; &gt; the required granularity. Currently all partitions are =
aligned to<br class=3D"">
&gt; &gt; &gt; flash<br class=3D"">
&gt; &gt; &gt; erase size (which is what we set block size to =
anyway).<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; Okay. It might be worth making a note in the documentation =
for<br class=3D"">
&gt; &gt; MBOX_GET_INFO saying as much.<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; &gt;<br class=3D"">
&gt; &gt; &gt; It's not really worth allowing locking at a =
finer&nbsp;granularity<br class=3D"">
&gt; &gt; &gt; than<br class=3D"">
&gt; &gt; &gt; block size since this is how changes (mark dirty) are =
specified<br class=3D"">
&gt; &gt; &gt; and<br class=3D"">
&gt; &gt; &gt; so<br class=3D"">
&gt; &gt; &gt; it would be impossible to write back any part of a block =
if a<br class=3D"">
&gt; &gt; &gt; single<br class=3D"">
&gt; &gt; &gt; byte in that block were locked. I'm in favour of using =
block size<br class=3D"">
&gt; &gt; &gt; for<br class=3D"">
&gt; &gt; &gt; now and changing it in a later version if this becomes an =
issue.<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; Right, it's either blocks for everything or bytes for =
everything.<br class=3D"">
&gt; &gt; Consistency is good. I don't think we want to go through the =
effort<br class=3D"">
&gt; &gt; of<br class=3D"">
&gt; &gt; changing that aspect of the spec right now.<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; Cheers,<br class=3D"">
&gt; &gt;<br class=3D"">
&gt; &gt; Andrew<br class=3D"">
</blockquote></div>
</div></blockquote></div><br class=3D""></div></body></html>=

--Apple-Mail=_7AD270B5-A458-4A71-89DD-4A3AFBE67C3A--
