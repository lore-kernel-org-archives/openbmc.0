Return-Path: <a.amelkin@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="rRgP1MYt"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40y8VH3QtpzF0dT
 for <openbmc@lists.ozlabs.org>; Sat,  2 Jun 2018 02:12:07 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id DC24850A07;
 Fri,  1 Jun 2018 16:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:from:from:references:subject:subject
 :received:received:received; s=mta-01; t=1527869522; x=
 1529683923; bh=sWw6i6QTLdKezTBhQl4ks+t9p08CmtHeRsI3y4xJOyM=; b=r
 RgP1MYtW9srika73aXraK59YiqNrmQ9JhxSyMvhs9BJM2ibocLiocP6uKvpyXhu0
 wTYFuyxonlZDEcNURinE2o4vt+bOpdwvXnlWAZZOOWXouqYN+nJRTU1DNCTpMYvw
 tZyMutDCBIAv2fzLKMTORrkzFSMom8e591ZdbVgP7o=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G7vkX3TVYs_E; Fri,  1 Jun 2018 19:12:02 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 85E35507EB;
 Fri,  1 Jun 2018 19:12:02 +0300 (MSK)
Received: from [172.17.14.168] (172.17.14.168) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 1 Jun
 2018 19:12:02 +0300
Subject: Re: Logging user actions
To: "Tanous, Ed" <ed.tanous@intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
References: <c0569989-b52d-745e-06fb-e92cbb1234c8@yadro.com>
 <5fe8ee1a-d4c3-e5f4-059e-d2f403849d6a@linux.vnet.ibm.com>
 <a29d9411-8000-0361-6e28-c668d2d9923f@yadro.com>
 <7E9441B1E5EFFD4681F54958E82169933BDDE358@ORSMSX114.amr.corp.intel.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Message-ID: <3cb5c373-9c9a-7a73-7132-19488117d9de@yadro.com>
Date: Fri, 1 Jun 2018 19:12:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169933BDDE358@ORSMSX114.amr.corp.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="efdxnIHTPtanroooQ5ohwaOBMjGBhpwhw"
X-Originating-IP: [172.17.14.168]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Jun 2018 16:12:08 -0000

--efdxnIHTPtanroooQ5ohwaOBMjGBhpwhw
Content-Type: multipart/mixed; boundary="JnGXKPrWSSurx3nOa4FrhgM5pyD1hFbyJ";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: "Tanous, Ed" <ed.tanous@intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <3cb5c373-9c9a-7a73-7132-19488117d9de@yadro.com>
Subject: Re: Logging user actions
References: <c0569989-b52d-745e-06fb-e92cbb1234c8@yadro.com>
 <5fe8ee1a-d4c3-e5f4-059e-d2f403849d6a@linux.vnet.ibm.com>
 <a29d9411-8000-0361-6e28-c668d2d9923f@yadro.com>
 <7E9441B1E5EFFD4681F54958E82169933BDDE358@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E82169933BDDE358@ORSMSX114.amr.corp.intel.com>

--JnGXKPrWSSurx3nOa4FrhgM5pyD1hFbyJ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

01.06.2018 18:23, Tanous, Ed wrote:
>> It would be great if we weren't using D-Bus at all or if we had all us=
er=20
>> interfaces connected to some central hub so that accounting informatio=
n=20
>> was available to that hub and it could log all user requests before tr=
anslating
>> them further to D-Bus.
>>
>> Don't IBM, Google, Intel and other big guys want to log user actions?
>> It's quite strange to not have this functionality in OpenBMC and, what=
 is
>> more important, not have the architectural possibility to properly (in=
 a single
>> place) implement it. It feels like I'm just missing something.
>>
>> Alexander.
> Does Intel want our systems to be able to log user actions?  Yes.
But your openbmc-based systems aren't yet capable of that, right?
> With that said, I'm not really following why this couldn't be done over=
 dbus, and why a "central hub" as you call it would make the task any eas=
ier.  Also, so you're aware, dbus-daemon (the entity that connects / auth=
enticates and authorizes all dbus connections and messages) could very ea=
sily be called a "central hub" and could be patched to log every dbus act=
ion if that was the route you wanted to go down.
As far as I understand, "dbus-daemon" only knows which other dbus daemon
sent the request. As you noted, today when every daemon is running as
root, there is little help in that. When a request comes to
phosphor-rest-server from phosphor-webui, the former doesn't forward the
authentication/accounting info to dbus-daemon (or at least not after it
has successfully created a session cookie for the user). Isn't it so?
> I don't really like DBus; I find it difficult to use, and more importan=
tly difficult to teach to people.  But it's what we have today, and so fa=
r as I can tell, it is capable of serving the purposes we need it to serv=
e, including the logging features we need to build in the future.  If you=
 have a suggestion for a better IPC design, and are willing to move all o=
f the existing daemons over to it, I'm sure some people would be willing =
to hear to you out, but I don't think logging being difficult to implemen=
t justifies that kind of major change for the project.
>
> I'm sure other have ideas on how to make this work.  In short, I would =
much rather spend resources on making the current solution we have work f=
or all use cases, even if it's not a beautiful architecture, than attempt=
ing to recreate what we have using another IPC.
>
> -Ed
Ed, thank you so much for your clarification. I'm not proposing to
change the IPC as it apparently appeared to you probably due to my bad
English. I don't like DBus either for exactly the same reasons that you
named (and because I don't understand it well and don't feel confident
about it), but I'm not proposing to ditch it and replace with anything
else. At least not right now. I would prefer classic IPCs like shm and
named semaphores, but that's out of the scope of this topic, definitely.

> Can you expand a little on your comment that dbus doesn't have any acco=
unting in its messages signals?  It has timing information, as well as us=
er information.  Were you hoping for a "requested from interface" type fi=
eld?  Today every daemon is running as root, and not authorizing as a spe=
cific system user, so that authorization info is not very useful, but tha=
t could be changed with a good understanding of the permissions system, a=
nd a good understanding of dbus, and by making the daemons run as non-roo=
t.  We are in the process of trying to do this anyway for bmcweb, albeit =
for different reasons, but the concept should be similar.
Yes, I was exactly hoping to have a "requested from interface" type
field as in "requested from WebUI by user 'john' coming from
172.17.31.12", not as in "requested from phosphor-foobar-daemon".

Can this be achieved in the existing architecture in any way? Maybe I
just don't know how to do it with dbus (or openbmc) and you can point me
to some documentation? That would be just great.

> Another design that could be attempted could be to add a new signal nam=
ed "user action" that we could plumb into all the user facing daemons tha=
t would populate the information to the logging daemon.  All the user-fac=
ing daemons would then be required to send that signal (either automatica=
lly via the sdbusplus bindings, or manually) on a user action.  While not=
 the ideal solution, it seems like it would solve the problem with genera=
ting too many system internal events, and would make what we're logging v=
ery explicit.  Also, we could attach whatever information we see fit.
This approach doesn't look much different to me than having separate
(direct) logging added to each of the user interfaces.
It has just the same problem: people __wil__ forget to add those "user
action" calls at all for newly added actions (or interfaces), or they
will add them to some user interface daemons and forget to add them to
others. Besides, almost every request to REST is a "user action", but
I'm not sure we'd like to see them all logged. Having a place where all
the requests from all possible (including future) user interfaces are
funneled through one point, filtered and logged in a uniform way would
solve that problem, but I'm not sure if that is feasible.

I really hope this discussion continues and we come up with some good
solution.

Thanks again.
Alexander.


--JnGXKPrWSSurx3nOa4FrhgM5pyD1hFbyJ--

--efdxnIHTPtanroooQ5ohwaOBMjGBhpwhw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJbEXBRAAoJEOiTWHtbdBeNeBQP/14ngvHIK3+wWPHRWAu358C7
GPjz0QLa79U6yLFswZ5yA8PHqCbX8qZ+zPLB2w8Jcc0+L93EG+7/kiRuBHp7Irhg
l/itsVVDlFt1Vdnjw20xHH3E+omjD8Q3Sq5Hd3/pvsPXmQCFgOf5TXeNRW89haT4
+YF3hU3qJxdtT5UvxF6sG5fijKMwg56BEXsByFjDkN/C/TM6cnhki0WNT+SQASGp
iJkLz9CXM9o2gx9I4xo4rjuMzP4pL594ccWPHSchT8moPNgFGGF+hzG6oGsN5o83
0z9xLrUQS8jwuOkqfU1pmPFsUtTZ37vIk5dxtgYNq7foDdOlH9ZPa1w5LARcT5rY
iOalrrUlDs2jcFwkYgapDFhyyxWMjBdeXPJRhKSdbRg3yjPHGqt3gCtF9JgEyTqZ
w2eWImBynQJLjFmWZVsvewGK4VZ4Mn+GO4nN9rUuDEaEyc0UnwYr6dHjQR9+yaXM
O4geoYhMG4Ju36s9D29Zih1uh4hPKehBSr7m5e1HIsN7yUFZ9rUzOLhTxxl3it83
XAruXAugk0yhP54sjNqYit1B0/rWEYh8aNtz+DWnJMxcr7Blfmq7RMWgat44QQK4
FOc16BL/WeHJdB9b9VjKdLcsG+LiOOFIagx8d5uCLIzewBeuW8JbphuoMgr2KGH1
f1d4A2w3Wd05otCianre
=3sts
-----END PGP SIGNATURE-----

--efdxnIHTPtanroooQ5ohwaOBMjGBhpwhw--
