Return-Path: <raltherr@google.com>
Received: from mail-yw0-x22f.google.com (mail-yw0-x22f.google.com
 [IPv6:2607:f8b0:4002:c05::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3scrgc5ygQzDqB4
 for <openbmc@lists.ozlabs.org>; Mon, 19 Sep 2016 13:18:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b=H1DHUL19; 
 dkim-atps=neutral
Received: by mail-yw0-x22f.google.com with SMTP id g192so129746904ywh.1
 for <openbmc@lists.ozlabs.org>; Sun, 18 Sep 2016 20:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=4ap6XnIQnMn4V5Idkm9kJ+q+RoY/uxnKm8mwPTCJCDY=;
 b=H1DHUL19jCQjLgoSgmlHNrVjSqd5B6/xF3eaUNZ7LuyqCFvhiMGdyDtpwEOntz4VuD
 SUgJTK5dQ9Q4yngwGadQ2pTzBaRBgHj86myINFaJ46sEPUOW7iYSw4j+Ob1WobODWPwF
 TD1QU8BkZ1V3bjUC8DFOmvdSdZvrx4TPcjyYkTRXQEJ7oD/2RmGkXU/mZ/Nw+bFrbv8d
 N2fwD7K1ZT4b1MX6E5uKlB/O1NPsGTllFckyOklZxsY3gOiYtbFXg4QNyRNV/uwm2SsD
 ZEo/nMkA2s76lkW71rMByexDUqSgIBije0IcFwSKoaeJY3FuQW2NDWKZdREdUdqf5FpG
 rRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=4ap6XnIQnMn4V5Idkm9kJ+q+RoY/uxnKm8mwPTCJCDY=;
 b=gdksPGSbqhbUc0knPwdY3BoRatz85R0XoJRuswDSL1d4uYlh6LUWpbX+WAYQQMmQhZ
 9JkAGGYMGAlgLyGcxI/WIvyOprhT+ysmfe++JrHl3r7GBcXHDBMLgDWVFmaoD0gxLA6A
 YebxvDR0TOY0bjhyI0uNy2fLCmbzB/CNaXxNGi5RD4l+WlQ0X0aShEMZE8eBNsFlk73y
 qnU/AaqCex5ia2djFnjb2cQ4fFxKTAgIY+6qSeRHju1H20NFTuqeqX+qD+nuJp+9b1ZQ
 GVG/tyE2HEsT8no/c9fG2IVqRtR0/Z8EJzqA72e0tQ2zeui497HI7iEmDjvtmql7xwok
 HSow==
X-Gm-Message-State: AE9vXwOEHBDVzje8/MHMYJ8NwTuzAw4gdnEmXvvOfHaq/Zz0LWcupHZtx2WNBOEinAjDdfsekJ0ZSWJDCL9FFctp
X-Received: by 10.13.254.135 with SMTP id o129mr23858530ywf.117.1474255097845; 
 Sun, 18 Sep 2016 20:18:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.160.4 with HTTP; Sun, 18 Sep 2016 20:18:17 -0700 (PDT)
In-Reply-To: <20160917124919.GA11301@heinlein.lan>
References: <20160917124919.GA11301@heinlein.lan>
From: Rick Altherr <raltherr@google.com>
Date: Sun, 18 Sep 2016 20:18:17 -0700
Message-ID: <CAPLgG=nnxBf882unObKXWJrPrPK=bJOhNK7_4X=Gw1vJsjAr-w@mail.gmail.com>
Subject: Re: Logging utilities.
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@linux.vnet.ibm.com>
Content-Type: multipart/alternative; boundary=94eb2c07e31e6acca9053cd3c3a8
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
X-List-Received-Date: Mon, 19 Sep 2016 03:18:21 -0000

--94eb2c07e31e6acca9053cd3c3a8
Content-Type: text/plain; charset=UTF-8

Thank you for the background.  That explains a lot about the path Adriana
has gone down.  I completely understand wanting to separate policy from
reporting of device and process errors.  Where we differ is that I don't
see that as the purpose of logging.  You've described an event-based
telemetry system meant to be primarily consumed by other software to drive
alerts and automated responses.  I view logging as being primarily for the
benefit of a programmer or operator trying to understand what section of
_code_ went wrong.  That distinction is part of why glog isn't designed to
be super high-performance.  Google uses entirely separate systems for
telemetry.  In my and Google's experience, scraping logs to extract
information (even when the messages are well structured) winds up being
painful to maintain and unreliable over time even when using journald.

On Sat, Sep 17, 2016 at 5:49 AM, Patrick Williams <patrick@stwcx.xyz> wrote:

> There is a commit on Gerrit where some discussion was requested on the
> libraries we plan to use for logging:
>     https://gerrit.openbmc-project.xyz/#/c/53/
> The suggestion was made that we consider google/glog as a logging
> library.
>
> Our intention with the program logging is to heavily leverage systemd's
> journal methods both for original program logging but also for later
> programmatic extraction on errors.  Adriana is working on the second
> part and will have some proof of concepts to share soon.
>
> Left to their own devices, two different programmers might create two
> logging events such as:
>     ERROR "Failed to open device %s, %s", device, strerror(errno)
>     ERROR "fopen on %s failed: %d", device, errno
>
> Notice in this case, not only is the English different but the content
> itself is different and impossible to parse out if we want to do
> something like automatically transpose "device" into a potentially
> failing FRU.  The journald approach is that you do not put content in
> English but you use meta-data tags to represent it.
>
>     LEVEL=ERROR, MESSAGE="Failed to open", FILE="%s", device,
>     ERRNO="%d", errno
>
> Now we have a message that humans can read ("Failed to open
> FILE=device") and one that computers can still interpret.  To take this
> a step further, consider adding another meta-data tag:
>     ERROR_EVENT="xyz.openbmc-project.Error.Device-Not-Found"
>
> We can now codify behavior, in a data format customizable per-system if
> needed, such as:
>     on xyz.openbmc-project.Error.Device-Not-Found:
>         [Device, AccessType] = parse-device-string(metadata.DEVICE)
>         Parts = devices-on-bus(BMC, Device, AccessType)
>         add-callout(Parts, High)
>         add-callout("Error.Device-Configuration", Low)
>
> Effectively, we separate the error identification from the error policy.
> There are a few major advantages of this:
>     1. Historically we have found that well over 50% of the code in this
>        environment ends up being dealing with errors, which makes the
>        code very difficult to understand and maintain.  By separating
>        the policy, we end up with something that is much more readable.
>     2. Different systems end up with policy quirks that tend to litter
>        the code.  "On this system i2c bus 3 goes through this extra
>        riser card and the connector ends up oxidizing faster than we
>        expected, so put that riser as the highest priority for
>        replacement."  We can now put this policy into a system-specific
>        enhancement file rather than --enable-firestone and #if
>        CONFIG_FIRESTONE littering all the packages.
>
> Now, back to the logging API, what Adriana delivered aligns very well
> with these metadata and error concepts because it was designed with
> these thoughts in mind (which, I know, we could have done a better job of
> communicating).  We enforce, at compile-time, that "messages" are static
> English statements and dynamic data is all tagged through the "entry"
> mechanism.  Down the line we will be able to further enforce, again at
> compile time, that log(error(xyz.openbmc-project.Device-Not-Found)...)
> must contain {entry(DEVICE), entry(ERRNO)} so that the program fails to
> compile if the required data, per the error definition, were not given.
>
> I don't see an easy way to leverage google/glog to include these
> concepts, other than simply having the logging utilities Adriana
> delivered use google/glog instead of systemd_journal.  At that point we
> are losing the mind-share(?) associated with using glog in the first
> place.
>
> Glog seems to be primarily oriented towards a logging infrastructure
> for a stand-alone application.  The default behavior of it is to create
> a log file in /tmp per process.  Due to the nature of our project, being
> a collection of interacting products, debug is often going to require
> aggregation of logging across the system and this is where journald
> would be needed as the back-end.  As Rick mentioned in the above review,
> glog doesn't currently support systemd as a back-end but that is likely
> trivial to add (or maybe available as an unreleased patch already).  It
> does seem like a significant code path to introduce simply as a way to
> get from a log statement to journald, when what Adriana delivered
> compiles directly to a single journald call.
>
> Glog also uses C++ iostream-style << operators.  I made a simple
> hello-world application using it and there ends up being a local object
> constructed to contain the buffer, a << operator call to insert a string
> into the buffer, and a destructor call to emit the log entry.  There is
> 4 function calls involved at a minimum for each log entry, plus an
> additional function call per-element.  So, in addition to the
> performance implications of whatever glog is doing internally, I have
> concerns about the code size impacts to using Glog due to the way the
> API is structured and implemented.
>
> In summary, I do not see an advantage to using glog over direct
> journald calls, and would prefer we incorporate something derived from
> what Adriana has proposed, for the following reasons:
>     1. The proposed API has syntactic handling for concepts we want in
>        our error-event design that glog does not.
>         a. glog could be inserted under phosphor::logging at any point
>            in the future without any code change to applications that
>            use phosphor::logging.
>     2. Glog has performance and size implications, over direct journald
>        calls, without much in the way of added value.
>
> There are a number of macros that Glog provides to simplify log
> interaction:
>         LOG_IF(condition) << entry
>     rather than
>         if (condition) { LOG << entry; }
>     (and many more)
>
> It does seem like a concept we could enhance the phosphor::logging
> interfaces with if we find that this makes the code more concise.  I
> would be interested to hear some of the more widely used macros and see
> those enhancements proposed in Gerrit.
>
> --
> Patrick Williams
>

--94eb2c07e31e6acca9053cd3c3a8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for the background.=C2=A0 That explains a lot ab=
out the path Adriana has gone down.=C2=A0 I completely understand wanting t=
o separate policy from reporting of device and process errors.=C2=A0 Where =
we differ is that I don&#39;t see that as the purpose of logging.=C2=A0 You=
&#39;ve described an event-based telemetry system meant to be primarily con=
sumed by other software to drive alerts and automated responses.=C2=A0 I vi=
ew logging as being primarily for the benefit of a programmer or operator t=
rying to understand what section of _code_ went wrong.=C2=A0 That distincti=
on is part of why glog isn&#39;t designed to be super high-performance.=C2=
=A0 Google uses entirely separate systems for telemetry.=C2=A0 In my and Go=
ogle&#39;s experience, scraping logs to extract information (even when the =
messages are well structured) winds up being painful to maintain and unreli=
able over time even when using journald.</div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">On Sat, Sep 17, 2016 at 5:49 AM, Patrick Willi=
ams <span dir=3D"ltr">&lt;<a href=3D"mailto:patrick@stwcx.xyz" target=3D"_b=
lank">patrick@stwcx.xyz</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">There is a commit on Gerrit where some discussion was requested on the=
<br>
libraries we plan to use for logging:<br>
=C2=A0 =C2=A0 <a href=3D"https://gerrit.openbmc-project.xyz/#/c/53/" rel=3D=
"noreferrer" target=3D"_blank">https://gerrit.openbmc-<wbr>project.xyz/#/c/=
53/</a><br>
The suggestion was made that we consider google/glog as a logging<br>
library.<br>
<br>
Our intention with the program logging is to heavily leverage systemd&#39;s=
<br>
journal methods both for original program logging but also for later<br>
programmatic extraction on errors.=C2=A0 Adriana is working on the second<b=
r>
part and will have some proof of concepts to share soon.<br>
<br>
Left to their own devices, two different programmers might create two<br>
logging events such as:<br>
=C2=A0 =C2=A0 ERROR &quot;Failed to open device %s, %s&quot;, device, strer=
ror(errno)<br>
=C2=A0 =C2=A0 ERROR &quot;fopen on %s failed: %d&quot;, device, errno<br>
<br>
Notice in this case, not only is the English different but the content<br>
itself is different and impossible to parse out if we want to do<br>
something like automatically transpose &quot;device&quot; into a potentiall=
y<br>
failing FRU.=C2=A0 The journald approach is that you do not put content in<=
br>
English but you use meta-data tags to represent it.<br>
<br>
=C2=A0 =C2=A0 LEVEL=3DERROR, MESSAGE=3D&quot;Failed to open&quot;, FILE=3D&=
quot;%s&quot;, device,<br>
=C2=A0 =C2=A0 ERRNO=3D&quot;%d&quot;, errno<br>
<br>
Now we have a message that humans can read (&quot;Failed to open<br>
FILE=3Ddevice&quot;) and one that computers can still interpret.=C2=A0 To t=
ake this<br>
a step further, consider adding another meta-data tag:<br>
=C2=A0 =C2=A0 ERROR_EVENT=3D&quot;xyz.openbmc-<wbr>project.Error.Device-Not=
-<wbr>Found&quot;<br>
<br>
We can now codify behavior, in a data format customizable per-system if<br>
needed, such as:<br>
=C2=A0 =C2=A0 on xyz.openbmc-project.Error.<wbr>Device-Not-Found:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [Device, AccessType] =3D parse-device-string(me=
tadata.<wbr>DEVICE)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Parts =3D devices-on-bus(BMC, Device, AccessTyp=
e)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 add-callout(Parts, High)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 add-callout(&quot;Error.Device-<wbr>Configurati=
on&quot;, Low)<br>
<br>
Effectively, we separate the error identification from the error policy.<br=
>
There are a few major advantages of this:<br>
=C2=A0 =C2=A0 1. Historically we have found that well over 50% of the code =
in this<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0environment ends up being dealing with errors, w=
hich makes the<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0code very difficult to understand and maintain.=
=C2=A0 By separating<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0the policy, we end up with something that is muc=
h more readable.<br>
=C2=A0 =C2=A0 2. Different systems end up with policy quirks that tend to l=
itter<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0the code.=C2=A0 &quot;On this system i2c bus 3 g=
oes through this extra<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0riser card and the connector ends up oxidizing f=
aster than we<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0expected, so put that riser as the highest prior=
ity for<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0replacement.&quot;=C2=A0 We can now put this pol=
icy into a system-specific<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0enhancement file rather than --enable-firestone =
and #if<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_FIRESTONE littering all the packages.<br>
<br>
Now, back to the logging API, what Adriana delivered aligns very well<br>
with these metadata and error concepts because it was designed with<br>
these thoughts in mind (which, I know, we could have done a better job of<b=
r>
communicating).=C2=A0 We enforce, at compile-time, that &quot;messages&quot=
; are static<br>
English statements and dynamic data is all tagged through the &quot;entry&q=
uot;<br>
mechanism.=C2=A0 Down the line we will be able to further enforce, again at=
<br>
compile time, that log(error(xyz.openbmc-project.<wbr>Device-Not-Found)...)=
<br>
must contain {entry(DEVICE), entry(ERRNO)} so that the program fails to<br>
compile if the required data, per the error definition, were not given.<br>
<br>
I don&#39;t see an easy way to leverage google/glog to include these<br>
concepts, other than simply having the logging utilities Adriana<br>
delivered use google/glog instead of systemd_journal.=C2=A0 At that point w=
e<br>
are losing the mind-share(?) associated with using glog in the first<br>
place.<br>
<br>
Glog seems to be primarily oriented towards a logging infrastructure<br>
for a stand-alone application.=C2=A0 The default behavior of it is to creat=
e<br>
a log file in /tmp per process.=C2=A0 Due to the nature of our project, bei=
ng<br>
a collection of interacting products, debug is often going to require<br>
aggregation of logging across the system and this is where journald<br>
would be needed as the back-end.=C2=A0 As Rick mentioned in the above revie=
w,<br>
glog doesn&#39;t currently support systemd as a back-end but that is likely=
<br>
trivial to add (or maybe available as an unreleased patch already).=C2=A0 I=
t<br>
does seem like a significant code path to introduce simply as a way to<br>
get from a log statement to journald, when what Adriana delivered<br>
compiles directly to a single journald call.<br>
<br>
Glog also uses C++ iostream-style &lt;&lt; operators.=C2=A0 I made a simple=
<br>
hello-world application using it and there ends up being a local object<br>
constructed to contain the buffer, a &lt;&lt; operator call to insert a str=
ing<br>
into the buffer, and a destructor call to emit the log entry.=C2=A0 There i=
s<br>
4 function calls involved at a minimum for each log entry, plus an<br>
additional function call per-element.=C2=A0 So, in addition to the<br>
performance implications of whatever glog is doing internally, I have<br>
concerns about the code size impacts to using Glog due to the way the<br>
API is structured and implemented.<br>
<br>
In summary, I do not see an advantage to using glog over direct<br>
journald calls, and would prefer we incorporate something derived from<br>
what Adriana has proposed, for the following reasons:<br>
=C2=A0 =C2=A0 1. The proposed API has syntactic handling for concepts we wa=
nt in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0our error-event design that glog does not.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 a. glog could be inserted under phosphor::loggi=
ng at any point<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0in the future without any code cha=
nge to applications that<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0use phosphor::logging.<br>
=C2=A0 =C2=A0 2. Glog has performance and size implications, over direct jo=
urnald<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0calls, without much in the way of added value.<b=
r>
<br>
There are a number of macros that Glog provides to simplify log<br>
interaction:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 LOG_IF(condition) &lt;&lt; entry<br>
=C2=A0 =C2=A0 rather than<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (condition) { LOG &lt;&lt; entry; }<br>
=C2=A0 =C2=A0 (and many more)<br>
<br>
It does seem like a concept we could enhance the phosphor::logging<br>
interfaces with if we find that this makes the code more concise.=C2=A0 I<b=
r>
would be interested to hear some of the more widely used macros and see<br>
those enhancements proposed in Gerrit.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Patrick Williams<br>
</font></span></blockquote></div><br></div>

--94eb2c07e31e6acca9053cd3c3a8--
