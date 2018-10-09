Return-Path: <emilyshaffer@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com;
 envelope-from=emilyshaffer@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="g/OXwtDq"; 
 dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42V5wF24h0zF3MZ
 for <openbmc@lists.ozlabs.org>; Wed, 10 Oct 2018 05:53:16 +1100 (AEDT)
Received: by mail-qt1-x82d.google.com with SMTP id l41-v6so2861579qtl.8
 for <openbmc@lists.ozlabs.org>; Tue, 09 Oct 2018 11:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1PaEpXz9uA80dSt1VHCFNRKAydmOiqRC1wYWXFOfvGE=;
 b=g/OXwtDq5wr+MrXerlmw6WfI+UzANO81f7u+aJkqA5h/DFYx7nk31VbehD4CkrN9zu
 JclMITQAT2LFyou8WpAmyehBJ9AcJgWgmQlNPSDvQ4Zzp/6rpFR/ifvDiMdJGj+nwNkP
 VWgb+XIPi/aPAwYa1QrOpt5ekuT7itLPqQtX2x4P/HlRJkOOv2YYJziE/RtfiS9Hq/n3
 hRviVL7U23Zx0kKIiBqNTuC+bC9Az+7/eglMd3mDFC84xJrbjW1h7/91FowONcQDQ2w+
 d0eDAgRr2Ln6/C7cJFuqXGJ5K2e05pMlnMpxe7wZDR7F6pRG6NV721S9UL7S83IpX8Ov
 oVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1PaEpXz9uA80dSt1VHCFNRKAydmOiqRC1wYWXFOfvGE=;
 b=FbGcrK1k2rwATKrxUpTy0wqgxNITF8epU0byG14JhL2KBdkL//lbsH3H+0jYHwlnaU
 NZtQHly+xUdtA4m/IQUyrLjvQLc2HpH658zNi0tOIMPofTcckY5C4O6MtEm5/DIzrPKo
 UFCf1T5KNWnMmqHlq9isqZp99I8p8ioFwNhSgKY8bX1rBXOEMfPzhZ2jIHqGYoKEGGxg
 6d+hUpJoOMpTlGf+LoV8y+OdR971ZB9MoOn3uWwwqRi4MX9lZGct/LIGlyG+8S9/QzIZ
 Qpmg400FV+iLPLx3ijoj/EEWL5LS4EQPkluaYpKY6WcISjLFx6ImonBg0JqzesmhmRVV
 z+QQ==
X-Gm-Message-State: ABuFfohzWCRxF5xA/wTOquQcpXK5VvPUtaxqpF6ZND8Jf2Cxn/HlpYpv
 cMWqV5ABarqOzyATx4LShSOKa7aWmBwQs4CNOhEe0Q==
X-Google-Smtp-Source: ACcGV61e0hMRnrxuYkmaazB2fqiW5EwDd2Qc3vZptxBM90JRoMGzU7Mm1TmePtji2E8uIt+22Q0k7braTvuTyh2FC38=
X-Received: by 2002:ac8:794a:: with SMTP id
 r10-v6mr1280483qtt.386.1539111194218; 
 Tue, 09 Oct 2018 11:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAJoAoZn3CSHRrtTi3r-B3aWn6t1CH3W3SLk_b_BJ3wiPsWrQvg@mail.gmail.com>
 <CA+YB3rb76TCnpLh3nXqcVtzGu0BUVWboWY87cNqgewm3ib=nFg@mail.gmail.com>
In-Reply-To: <CA+YB3rb76TCnpLh3nXqcVtzGu0BUVWboWY87cNqgewm3ib=nFg@mail.gmail.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Tue, 9 Oct 2018 11:53:01 -0700
Message-ID: <CAJoAoZ=fspkuFtZgyErrF6JjD2oR=uau3=gVb4ipugNQ2Qv2Kg@mail.gmail.com>
Subject: Re: Community Code of Conduct
To: Jeff Osier-Mixon <jefro.net@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000000cd210577d04043"
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
X-List-Received-Date: Tue, 09 Oct 2018 18:53:18 -0000

--00000000000000cd210577d04043
Content-Type: text/plain; charset="UTF-8"

Reading through this, I've got a couple concerns:

- There's a clause for enforcement. How do we want to assign ownership when
enforcement is needed? We probably want to lay it out, I'm not sure that it
should come through the TSC. Maybe Kurt would be a good start as the
community manager? No offense to Kurt but I'd also like an escalation path
or alternative path - with these kinds of things it's important to be able
to bypass an individual if necessary.

- The clause on scope seems to me like it may leave a gap surrounding
harassment of community members outside of the official OpenBMC setting -
ie, Foo posts to their Twitter account, "I'm having a lot of trouble with
Bar's code reviews. What an idiot! Tell them so - their email is bar@baz.org!"
I'm not sure I'm seeing how the contributor covenant protects against this
kind of behavior. Maybe I'm just misreading and this counts as "prviate
communication"?

On Tue, Oct 9, 2018 at 11:31 AM Jeff Osier-Mixon <jefro.net@gmail.com>
wrote:

> Hi folks
>
> We strongly recommend the contributor covenant coc. Being adopted by many
> projects.
>
> https://www.contributor-covenant.org/version/1/4/code-of-conduct
>
> Glad to discuss more
>
> On Tue, Oct 9, 2018, 11:28 AM Emily Shaffer <emilyshaffer@google.com>
> wrote:
>
>> Hi all,
>>
>> As I briefly mentioned at the end of Brad's presentation today, I'd like
>> to propose adding and enforcing a code of conduct for us to follow.
>>
>> For now, I am planning to grab a copy of the Linux CoC and put it up for
>> review in /docs. If anybody has a different CoC source to suggest, I'd be
>> happy to discuss.
>>
>> Brad asked me whether I had seen an issue so far and I had not, so please
>> don't take this email as some kind of retaliation - it's not. I think we've
>> got a great, positive community and as we grow I'd like to preserve that
>> culture, and the code of conduct is a great way to do so.
>>
>> - Emily
>>
>

--00000000000000cd210577d04043
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Reading through this, I&#39;ve got a couple concerns:<div>=
<br></div><div>- There&#39;s a clause for enforcement. How do we want to as=
sign ownership when enforcement is needed? We probably want to lay it out, =
I&#39;m not sure that it should come through the TSC. Maybe Kurt would be a=
 good start as the community manager? No offense to Kurt but I&#39;d also l=
ike an escalation path or alternative path - with these kinds of things it&=
#39;s important to be able to bypass an individual if necessary.</div><div>=
<br></div><div>- The clause on scope seems to me like it may leave a gap su=
rrounding harassment of community members outside of the official OpenBMC s=
etting - ie, Foo posts to their Twitter account, &quot;I&#39;m having a lot=
 of trouble with Bar&#39;s code reviews. What an idiot! Tell them so - thei=
r email is=C2=A0<a href=3D"mailto:bar@baz.org">bar@baz.org</a>!&quot; I&#39=
;m not sure I&#39;m seeing how the contributor covenant protects against th=
is kind of behavior. Maybe I&#39;m just misreading and this counts as &quot=
;prviate communication&quot;?</div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr">On Tue, Oct 9, 2018 at 11:31 AM Jeff Osier-Mixon &lt;<a href=
=3D"mailto:jefro.net@gmail.com">jefro.net@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex"><div dir=3D"auto">Hi folks=C2=A0<div dir=3D=
"auto"><br></div><div dir=3D"auto">We strongly recommend the contributor co=
venant coc. Being adopted by many projects.=C2=A0</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto"><span style=3D"font-family:sans-serif"><a href=3D=
"https://www.contributor-covenant.org/version/1/4/code-of-conduct" target=
=3D"_blank">https://www.contributor-covenant.org/version/1/4/code-of-conduc=
t</a></span><br></div><div dir=3D"auto"><span style=3D"font-family:sans-ser=
if"><br></span></div><div dir=3D"auto"><span style=3D"font-family:sans-seri=
f">Glad to discuss more</span></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr">On Tue, Oct 9, 2018, 11:28 AM Emily Shaffer &lt;<a href=3D"m=
ailto:emilyshaffer@google.com" target=3D"_blank">emilyshaffer@google.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi al=
l,<div><br></div><div>As I briefly mentioned at the end of Brad&#39;s prese=
ntation today, I&#39;d like to propose adding and enforcing a code of condu=
ct for us to follow.</div><div><br></div><div>For now, I am planning to gra=
b a copy of the Linux CoC and put it up for review in /docs. If anybody has=
 a different CoC source to suggest, I&#39;d be happy to discuss.</div><div>=
<br></div><div>Brad asked me whether I had seen an issue so far and I had n=
ot, so please don&#39;t take this email as some kind of retaliation - it&#3=
9;s not. I think we&#39;ve got a great, positive community and as we grow I=
&#39;d like to preserve that culture, and the code of conduct is a great wa=
y to do so.</div><div><br></div><div>- Emily</div></div>
</blockquote></div>
</blockquote></div>

--00000000000000cd210577d04043--
