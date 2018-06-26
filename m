Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::22d; helo=mail-it0-x22d.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="e6ITXQB4"; 
 dkim-atps=neutral
Received: from mail-it0-x22d.google.com (mail-it0-x22d.google.com
 [IPv6:2607:f8b0:4001:c0b::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41FbcZ1bbmzF1DM
 for <openbmc@lists.ozlabs.org>; Wed, 27 Jun 2018 05:26:06 +1000 (AEST)
Received: by mail-it0-x22d.google.com with SMTP id 76-v6so4007119itx.4
 for <openbmc@lists.ozlabs.org>; Tue, 26 Jun 2018 12:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=fqZwQAZiKyZiIBByuSOpZb4CY7Oy719RSuC+fkZb/rs=;
 b=e6ITXQB4zI1G8rx6ui3a8hv1nwY8jnlw9vC/PDSwWk3iNWuTYRTbCSCQ1taRhhnUdF
 +u+0/aX5tVGlaPnpMo1RbIhS4AWDYM4qlm5b4qgITrwBM4DewQ3FCsAkF0LdtbIplL9a
 a9ezuzMGsO83ZESkSD+8dICCKAMMc+Ptd2uBWp6JFmXY7QJyY/92q3OtNqrhG9nq3xCj
 4yu+CpfULCj98FlXWB6QdmxS4NRDun33wKroQdtZx/t34tAXuxf0RAlyAU3+x7OXAbM/
 yhMMnwqTlIofFIgSow3D5CgOHDHkFCmXfnKlv95agj2yfLvWf/lklE3WFzUpwl5FOhC2
 Go4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=fqZwQAZiKyZiIBByuSOpZb4CY7Oy719RSuC+fkZb/rs=;
 b=afZxu6Mjw8NZXVWMLYDK/33+iwd3+mdufuvisSIQhCU52KtPu5XkHtoRTvZU7EKoUt
 HaZlqUB3v1eIvi+s82tv2yeHZs5evR5Gbia/d7ZsCHnnfg4sU2t+apmmb6xAKbc72SJW
 hDm1wFZLxeWF9pCX8ymIQWX8OQchzeQIVtt/WkVArvYGOWQwpU4/3TCABGCm4/Y3UBwx
 mp9i4GnhnNB08f6GuOeZER66A11Tyt9YTRR3lcvSBV4/hTaFu9tGg+a9Z/swRZ8fpFJb
 qgD7NFMoape2PxZ0fO8tAUoAiDm8myFifvfQri/NhVlQHQS7DPuYCjVUPfOuublJ/d8b
 rZQw==
X-Gm-Message-State: APt69E1f8cL4tccye2BIZBtRDj1r2r1lbcF9JF9NKedPzXo8oxV+4AmR
 J5YNfam6eHb622IV+MllrnIOds6NGnHXzYPLjHVmOiO+
X-Google-Smtp-Source: AAOMgpeYy9z8f6mQnNCpnbXSaZT+LQArZjA0QWD4/tYzqbDdcqCxbFAYaMV9B91EbaTB6B82fo/wW9ilMDnSIxI/Ayk=
X-Received: by 2002:a24:8988:: with SMTP id
 s130-v6mr2550707itd.144.1530041163355; 
 Tue, 26 Jun 2018 12:26:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:d481:0:0:0:0:0 with HTTP; Tue, 26 Jun 2018 12:26:02
 -0700 (PDT)
From: Kurt Taylor <kurt.r.taylor@gmail.com>
Date: Tue, 26 Jun 2018 14:26:02 -0500
Message-ID: <CAG5OiwjQA41nZP1Usj-0kk4bTWvac0mbmK=VU4jhZ2uS7W+-Jw@mail.gmail.com>
Subject: OpenBMC Release Planning WG Kickoff Meeting
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>, "Mihm,
 James" <james.mihm@intel.com>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>, sdasari@fb.com, 
 Ali Larijani <alirhas@microsoft.com>, Nancy Yuen <yuenn@google.com>, 
 Dick Wilkins <Dick_Wilkins@phoenix.com>
Content-Type: multipart/alternative; boundary="000000000000089fd0056f90781e"
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
X-List-Received-Date: Tue, 26 Jun 2018 19:26:06 -0000

--000000000000089fd0056f90781e
Content-Type: text/plain; charset="UTF-8"

I still have not heard from Facebook or Microsoft, but the majority of
responses were for Thursday at 3:00pm Central US (2000 UTC) so we will
start there.

I will send email with the meeting info by tomorrow evening. I am stalling
in hopes that my webex account will be reactivated (it was disabled due to
a 2 week inactivity, sigh). If you have not replied, please do as I will
only invite those that reply (call info will not be made public).

I have created a wiki page for the agenda just as we have for the community
call, and I'll keep meeting minutes to send out on the list following the
meeting. Please add new agenda items in the backlog:
https://github.com/openbmc/openbmc/wiki/Release-Planning

The goal is to quickly produce a prioritized list of deliverables for our
first release this November. So, for this kickoff meeting, I'd like to see
the following:

1) Release planning representatives (primary contact)
2) Agreement on the release week in November (Nov 12-16)
3) Agreement on release numbering (OpenBMC 3.0)
4) Milestones, how many and when (design, code 1, code freeze)
5) Top 3 "Must deliver" items from each company

That is a very full agenda for an hour, so please be punctual as we will
dive right in at 3:00.

Regards,
Kurt Taylor (krtaylor)

--000000000000089fd0056f90781e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div><div><div><div>I still =
have not heard from Facebook or Microsoft, but the majority of responses we=
re for Thursday at 3:00pm Central US (2000 UTC) so we will start there.<br>=
<br></div>I will send email with the meeting info by tomorrow evening. I am=
 stalling in hopes that my webex account will be reactivated (it was disabl=
ed due to a 2 week inactivity, sigh). If you have not replied, please do as=
 I will only invite those that reply (call info will not be made public).<b=
r><br></div>I have created a wiki page for the agenda just as we have for t=
he community call, and I&#39;ll keep meeting minutes to send out on the lis=
t following the meeting. Please add new agenda items in the backlog:<br><a =
href=3D"https://github.com/openbmc/openbmc/wiki/Release-Planning">https://g=
ithub.com/openbmc/openbmc/wiki/Release-Planning</a><br><br></div>The goal i=
s to quickly produce a prioritized list of deliverables for our first relea=
se this November. So, for this kickoff meeting, I&#39;d like to see the fol=
lowing:<br><br></div>1) Release planning representatives (primary contact)<=
br></div><div>2) Agreement on the release week in November (Nov 12-16)<br><=
/div>3) Agreement on release numbering (OpenBMC 3.0)<br></div>4) Milestones=
, how many and when (design, code 1, code freeze)<br></div>5) Top 3 &quot;M=
ust deliver&quot; items from each company<br><br></div>That is a very full =
agenda for an hour, so please be punctual as we will dive right in at 3:00.=
<br><br></div>Regards,<br></div>Kurt Taylor (krtaylor)<br></div>

--000000000000089fd0056f90781e--
