Return-Path: <kunyi@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4001:c0b::234; helo=mail-it0-x234.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="e+JeYKEe"; 
 dkim-atps=neutral
Received: from mail-it0-x234.google.com (mail-it0-x234.google.com
 [IPv6:2607:f8b0:4001:c0b::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428QPy3RS7zF36Y
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 10:14:12 +1000 (AEST)
Received: by mail-it0-x234.google.com with SMTP id j198-v6so7449369ita.0
 for <openbmc@lists.ozlabs.org>; Mon, 10 Sep 2018 17:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=50jIdwS2xElopTEA2bHK3g12VlzRLdShuOkvW3c4ZcU=;
 b=e+JeYKEe6761wBbU9ugrcUsmV5VciuXHY70d1bLv0ODqgTrewgmEqkgqciu6qUWeMr
 kahLS9GB7VsGMPn1x0tPsoXb+4QognqqLblMlpO3OFRcqF3u2hHgzahS9v0ZwG7Facsl
 ihrnHfOgg4ykWg9Z7n1/YL20VfBUqp499uMyvubBPXspqQ6cbfn+OJ0PdD025byWGRqr
 7D2t7QSypHMPxvoA3uGtvF0Z7uHkwd8yugsgfqzoutRAG1GugFGIp3lMLsMuFHjnWJ2x
 DcJp7G2jGCn0K3YCFIB01DSITxWcfLZSI2cH+sMLuLiZ1VNkIdRtw9HM47nMdlcj9Vgi
 8Idg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=50jIdwS2xElopTEA2bHK3g12VlzRLdShuOkvW3c4ZcU=;
 b=BP0jHCzme+rAOiIC5WQ3F/WahUxciRFL8m6if3byVBDQfQy68PXtHT5x8FnQqLQ27G
 7nRg60CsnkxzW4Bze3he8PSKM6rzIyvKnWlDEuVVU+kgREySO52q8ks5pELhRDFuJpbS
 1g0rv7HNd87gp6weBmZit0CL/JrZcCwaulNEvPuP4J3bwISrRELT9oeGFt7AD6JD9Q/p
 1ms+A7o2v5+I5t9Lbxsu3ojl24d7Qcqle7CrDoPmhpR8Oqd1axSZaZ6nTuYD6NC2MRH+
 /Vs2wzs5WEXXonrd8auOA+qF5E8AsgNhMzd9KC7fNS6MPmKCiOxv85ivgaGi1URVmmEA
 Wasg==
X-Gm-Message-State: APzg51AeSuffCpVA00UTrakcLbyk7TybBV2PFZNI4EDggerBcH4DfD3v
 gyscDESbcFnh9kmzeBGls/aFVqTjj/8slWfvbvfkMQ==
X-Google-Smtp-Source: ANB0VdYByVRLDGWy5wdHxCNADcOJjWSlk3z7ckqWkQrL8LMkNuPlAcmXe2nqVcn43ZaCBfF9xMklN5ONNmjQY2VvsOQ=
X-Received: by 2002:a02:9a10:: with SMTP id
 b16-v6mr21014140jal.4.1536624850468; 
 Mon, 10 Sep 2018 17:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notz1BPmjSTmcLBKOs1Cv9FNqGCi5zYBw24jufDjXdPHR7g@mail.gmail.com>
 <CAPnigKn2OfoNdFiJ30XuKRpyXogcQvxPWF_cSTqqghbPywcCJg@mail.gmail.com>
In-Reply-To: <CAPnigKn2OfoNdFiJ30XuKRpyXogcQvxPWF_cSTqqghbPywcCJg@mail.gmail.com>
From: Kun Yi <kunyi@google.com>
Date: Mon, 10 Sep 2018 17:13:43 -0700
Message-ID: <CAGMNF6Wc6PF7+g-pn5htbnmajBP+Ax4pNSHhFRgLua-zTTYb7w@mail.gmail.com>
Subject: Re: is_method_error versus call() errors
To: William Kennington <wak@google.com>
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000005e365005758d5a5a"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2018 00:14:15 -0000

--0000000000005e365005758d5a5a
Content-Type: text/plain; charset="UTF-8"

I think correspondingly we should start adding unit tests that checks our
code are exception safe.

Meanwhile, in some cases we don't really care from which level the error
originates. Does it make sense to have a macro like:

#define IS_ERROR_OR_EXCEPTION(dbus_call) \
  try { \
    return (dbus_call).is_method_error(); \
  } catch (const sdbusplus::exception::SdBusError& ex) { \
    return true; \
  }

On Mon, Sep 10, 2018 at 2:50 PM William Kennington <wak@google.com> wrote:

> This is something that is a little confusing about the semantics of
> sdbus. When using sd_bus_call(), it will only populate the returned
> message pointer if the dbus rpc succeeds. In the case where something
> fails at the dbus level, the sd_bus_call() method fails and the
> message is never populated. If we don't check for errors on
> sd_bus_call() but use sd_bus_message_is_method_error on the NULL
> message, we get an -EINVAL and treat that as an error. This behavior
> works fine if you only care that you had an error, but don't need to
> interpret the error and perform special case handling depending on the
> type. This is why I added the exceptions to sd_bus_call() so that we
> can parse out specific errors like -EBUSY or -EINTR, but handle the
> rest differently.
>
> sd_bus_message_is_method_error() is supposed to be used for checking
> if the server we are talking to sent an error response, not if the
> dbus layer had some kind of error. These errors are application
> specific and can be parsed out of a valid message if they exist.
> sd_bus_call() will still return success even if the server method sent
> a METHOD_ERROR type of message. You can't technically rely on
> sd_bus_message_read returning an error when reading from a
> METHOD_ERROR type of message. Practically though if your METHOD_ERROR
> message never have any content the read will fail since the message
> won't contain the expected data types. Unfortunately this means we
> will should keep all of the is_method_error checks and make sure c++
> exception handling is in place for all of the daemons.On Mon, Sep 10,
> 2018 at 9:18 AM Patrick Venture <venture@google.com> wrote:
> >
> > Given:
> >
> > _public_ int sd_bus_message_is_method_error(sd_bus_message *m, const
> > char *name) {
> >         assert_return(m, -EINVAL);
> >         if (m->header->type != SD_BUS_MESSAGE_METHOD_ERROR)
> >                 return 0;
> >         if (name && (!m->error.name || !streq(m->error.name, name)))
> >                 return 0;
> >         return 1;
> > }
> >
> > The failures from call() don't always set the reply (maybe don't ever,
> > but I didn't read it closely).  Which means, is_method_error() can
> > happen when the bus call itself was fine, so we need to check both IFF
> > we're going to read the response.
> >
> > I'm working on eliminating the new crashes from phosphor-host-ipmid
> > and other repositories, now that sdbusplus can except, which is not
> > caught even though there's an error case for is_method_error()
> > immediately after the call.
> >
> > In phosphor-pid-control, I dropped the is_method_error() check, but I
> > think it's still valid before trying to read() a message -- so I will
> > likely throw a patch adding that check.
> >
> > Patrick
>


-- 
Regards,
Kun

--0000000000005e365005758d5a5a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">I think correspondingly we should start a=
dding unit tests that checks our code are exception safe.<div><br></div><di=
v>Meanwhile, in some cases we don&#39;t really care from which level the er=
ror originates. Does it make=C2=A0sense to have a macro like:</div><div><br=
></div><div>#define IS_ERROR_OR_EXCEPTION(dbus_call) \</div><div>=C2=A0 try=
 { \</div><div>=C2=A0 =C2=A0 return (dbus_call).is_method_error(); \</div><=
div>=C2=A0 } catch (const sdbusplus::exception::SdBusError&amp; ex) { \</di=
v><div>=C2=A0 =C2=A0 return true; \</div><div>=C2=A0 }</div></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, Sep 10, 2018 at 2:50 P=
M William Kennington &lt;<a href=3D"mailto:wak@google.com">wak@google.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This is something tha=
t is a little confusing about the semantics of<br>
sdbus. When using sd_bus_call(), it will only populate the returned<br>
message pointer if the dbus rpc succeeds. In the case where something<br>
fails at the dbus level, the sd_bus_call() method fails and the<br>
message is never populated. If we don&#39;t check for errors on<br>
sd_bus_call() but use sd_bus_message_is_method_error on the NULL<br>
message, we get an -EINVAL and treat that as an error. This behavior<br>
works fine if you only care that you had an error, but don&#39;t need to<br=
>
interpret the error and perform special case handling depending on the<br>
type. This is why I added the exceptions to sd_bus_call() so that we<br>
can parse out specific errors like -EBUSY or -EINTR, but handle the<br>
rest differently.<br>
<br>
sd_bus_message_is_method_error() is supposed to be used for checking<br>
if the server we are talking to sent an error response, not if the<br>
dbus layer had some kind of error. These errors are application<br>
specific and can be parsed out of a valid message if they exist.<br>
sd_bus_call() will still return success even if the server method sent<br>
a METHOD_ERROR type of message. You can&#39;t technically rely on<br>
sd_bus_message_read returning an error when reading from a<br>
METHOD_ERROR type of message. Practically though if your METHOD_ERROR<br>
message never have any content the read will fail since the message<br>
won&#39;t contain the expected data types. Unfortunately this means we<br>
will should keep all of the is_method_error checks and make sure c++<br>
exception handling is in place for all of the daemons.On Mon, Sep 10,<br>
2018 at 9:18 AM Patrick Venture &lt;<a href=3D"mailto:venture@google.com" t=
arget=3D"_blank">venture@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Given:<br>
&gt;<br>
&gt; _public_ int sd_bus_message_is_method_error(sd_bus_message *m, const<b=
r>
&gt; char *name) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert_return(m, -EINVAL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (m-&gt;header-&gt;type !=3D SD_BUS=
_MESSAGE_METHOD_ERROR)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (name &amp;&amp; (!m-&gt;<a href=
=3D"http://error.name" rel=3D"noreferrer" target=3D"_blank">error.name</a> =
|| !streq(m-&gt;<a href=3D"http://error.name" rel=3D"noreferrer" target=3D"=
_blank">error.name</a>, name)))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
&gt; }<br>
&gt;<br>
&gt; The failures from call() don&#39;t always set the reply (maybe don&#39=
;t ever,<br>
&gt; but I didn&#39;t read it closely).=C2=A0 Which means, is_method_error(=
) can<br>
&gt; happen when the bus call itself was fine, so we need to check both IFF=
<br>
&gt; we&#39;re going to read the response.<br>
&gt;<br>
&gt; I&#39;m working on eliminating the new crashes from phosphor-host-ipmi=
d<br>
&gt; and other repositories, now that sdbusplus can except, which is not<br=
>
&gt; caught even though there&#39;s an error case for is_method_error()<br>
&gt; immediately after the call.<br>
&gt;<br>
&gt; In phosphor-pid-control, I dropped the is_method_error() check, but I<=
br>
&gt; think it&#39;s still valid before trying to read() a message -- so I w=
ill<br>
&gt; likely throw a patch adding that check.<br>
&gt;<br>
&gt; Patrick<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr">Regards,<div>Kun</div></div></div>

--0000000000005e365005758d5a5a--
