Return-Path: <susantjasinski@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com;
 envelope-from=susantjasinski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LUchKeD0"; 
 dkim-atps=neutral
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44526344S7zDqRd
 for <openbmc@lists.ozlabs.org>; Fri, 22 Feb 2019 04:49:15 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id r124so14082900pgr.3
 for <openbmc@lists.ozlabs.org>; Thu, 21 Feb 2019 09:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/bS0NyO7+X0YuSD6NU0JYVkYRwEjtrk9ueVr5KmlxCA=;
 b=LUchKeD0rzksth4EW5qyD8J2JHa9R2RC5mJgHI7JWW9H5vXWHQrbx6V8wTUGOHznrz
 WbGQ1Uxc7L/bfsupMtxZlpJyU1U5JcBbBtROTQJ0Lvw+ODIlq/1TtiwhFDoKmOLvPYKu
 hy08lGdAJRiBouw+e1/NXgScB9aimsHaYUu/ScL2zxO97o/BMkmgnHyQM5SraogT9jIn
 cwIDCI2Y5/H4fae56nM3PLRp+Z+UVYT1dlRF6+Aj8Dx2PcbY+WkT71CI/sHd7HhVkFCi
 8CWMaZ3y1X5CXaWMz+2XV2hjkvfbsOjaJHo++yLgkTGP5b/xUh2ItxY5452uMP8ROD9x
 2pjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/bS0NyO7+X0YuSD6NU0JYVkYRwEjtrk9ueVr5KmlxCA=;
 b=Ctd0Vdwx9Qu5GdIN76RRDA4fUIGpCW6A14Y9i3qKeD0RKPtHIwpUcDOcwsyCOWF8cY
 QaKRLbhrlsjvNDtZsDZYCXNgpkoleTk76uXj/FTaqAyJflAVhn8xuu0YPPcXO0dEP3is
 hY0/BevJksHqQnI898aTjpJrqvlzh4JX/Dt0JZIS3lBR+SH3j7BP9vy5ehd4U3P6nB0F
 2GGzse1r+0OH1ZjjEicMNPt+DtqYIh58K5MnP7p/qjswNVebA9dQkooDZiON1Z1I78Cg
 FbU3Twumf3n3c+mspjNMO3pnkD8W6jW8FPJXU8Q+BOwUNIYtXjlqhm7Ug9TCOAASK1SI
 7mKg==
X-Gm-Message-State: AHQUAubfzgF4Y0PieHOANXYY5FKQn2b3sKdM/2LWo0Xt7F/7IWPpwsqo
 t6qIhIGQJwoo0LGxDAyeEgmMMuRhuCQveVH4Kng=
X-Google-Smtp-Source: AHgI3IYCiVUKRxR6lYJmAPa3FMcmppBQu78I9kTwMsmuf6H0R5kEOAEbeVhx8JB58Hy61IWjxhigPE8CrU4XoP27/dY=
X-Received: by 2002:aa7:838c:: with SMTP id u12mr33437294pfm.189.1550771352974; 
 Thu, 21 Feb 2019 09:49:12 -0800 (PST)
MIME-Version: 1.0
References: <CANT4Nr+Gpd7roWyPT5vpeskL9bvKBbsKKma_6WhPpenWdwACwg@mail.gmail.com>
 <c28330a3-e3ab-56c8-b9bb-1a4160a08466@yadro.com>
In-Reply-To: <c28330a3-e3ab-56c8-b9bb-1a4160a08466@yadro.com>
From: susan jasinski <susantjasinski@gmail.com>
Date: Thu, 21 Feb 2019 11:49:02 -0600
Message-ID: <CANT4NrLYh39Orq5UKCSH1rH87PyTkEi-+DoXg0HnSdNGzSVR1w@mail.gmail.com>
Subject: Re: GUI translation bundles
To: Alexander Amelkin <a.amelkin@yadro.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 21 Feb 2019 17:49:16 -0000

Thank you for your feedback, Alexander.

- Angular Translate framework will be used for our GUI globalization servic=
e

- There will be a language selector on the login panel. It will be
enabled when after we have more than one translation completed/tested.

- You are right ... adding variables into the middle of a text string
is challenging for translators. We found 2 instances of this in the
current GUI build and changed the phrase so that the variable is at
the end of the phr. For example, on the Overview panel, we changed
"Turn on/off server LED" to "Turn server LED on/off".

- Regarding common phrases, I meant those phrases or words that appear
on many or most panels. For example, "Cancel" and "Save settings" are
2 buttons that will appear on several of the new panels IBM is working
on. In this case, should we include them in the bundle for every page
(if that is the route we choose), or should we add them to this
over-arching bundle so they are only translated one time, therefore
ensuring translation consistency?


On Mon, Feb 18, 2019 at 3:19 AM Alexander Amelkin <a.amelkin@yadro.com> wro=
te:
>
> Hi, Susan!
>
> 15.02.2019 23:17, susan jasinski wrote:
>
> > I=E2=80=99d like some feedback about how to breakdown translation bundl=
es for the GUI.
> >
> > My initial thought is to create a bundle per panel since companies
> > have the option to pick and choose which upstream panels they want to
> > use. Would this be an overwhelming amount of bundles? Does this idea
> > scale well as we grow the number of panels? Does this scale well as
> > new panels are added after existing panels have already been
> > translated?
> >
> > In addition, there could a =E2=80=9Cglobal=E2=80=9D bundle for navigati=
on and header,
> > Should this include words/phrases that are common across many panels
> > such as =E2=80=9Csave=E2=80=9D and =E2=80=9Ccancel=E2=80=9D?
> >
> > Also, should GUI notifications/messages be in their own bundle or put
> > into their respective panel=E2=80=99s bundle?
> >
> > Can you think of other factors that should guide this decision?
>
> Are you going to use some ready framework for translations or are you goi=
ng to develop a new one?
>
> It would be great if the solution provided an option for quick language s=
witching.
>
> I once implemented such a solution, it used a json map of English strings=
 to local strings. All translatable objects had a special class name, and t=
he client-side Javascript code used that class to find all to-be-translated=
 objects and on the fly changed their innerHTML using the map (saving the o=
riginal content in an object's property). The con was that the implementati=
on was only able to process simple strings and couldn't be applied to objec=
ts containing variable text (e.g. values embedded in text like "You have 12=
 new messages"). The problem is that different languages may require the va=
riable part at different locations within the string and also may use incli=
nations, so you can't just break such strings apart and translate "You have=
" and "new messages" separately because the translation may not just requir=
e writing it like "12 new messages you have", but will also be different fo=
r, say, 21 and 22 messages. At least for Russian language the latter is def=
initely a problem
> to think of: we'll say "=D0=A3 =D0=B2=D0=B0=D1=81 21 =D0=BD=D0=BE=D0=B2=
=D0=9E=D0=95 =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=95", but "=
=D0=A3 =D0=B2=D0=B0=D1=81 22 =D0=BD=D0=BE=D0=B2=D0=AB=D0=A5 =D1=81=D0=BE=D0=
=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=AF". I believe other Slavic languages,=
 and at least German and French are also affected by similar problems.
>
> That also concerns your question about "common" phrases. What is "common"=
 in English, may differ significantly depending on context in other languag=
es.
>
> I implore you to not forget about such peculiarities. In the past I've ha=
d issues with some software packages whose authors didn't think about that,=
 and it was a pain translating those packages.
>
> As to bundling, I think that if something is shipped as a separate bundle=
, can be removed or added, then the translation data must go along with the=
 rest of the bundle. The translation engine however must either be a separa=
te bundle per se or be embedded into the core of WebUI.
>
> Alexander Amelkin
>
>
