Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="t2+xmwNw"; 
 dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 429XVQ4rYWzF37m
 for <openbmc@lists.ozlabs.org>; Thu, 13 Sep 2018 05:51:57 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id g23-v6so1465911plq.9
 for <openbmc@lists.ozlabs.org>; Wed, 12 Sep 2018 12:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=93iMoC3KPx/x0Q6JGc5TcdEXDXQ5YXnOwP35BihAxIw=;
 b=t2+xmwNwV1lXNNXRebR+4mmCzyg/YAri9VGXb9QaNuwjpUhK6L1w7FiYLhsNH70H85
 jQ5QY4QWGdA8mcf8U6N7fohgb3vrkcze7fajNYaqbJYXqo3RYRsssKalOHu7Xuc5hw3Z
 qeb4/jB4Jbhj/oUg8TTX152EhxgHVVcBIqbdPu0SOgqIA0lBn4iIRBKevfUChIZUD5pp
 AP6d/q7GBl4suUTsXynalB0PtOj3jIhIqVoJChScQBPWt+xb8eP8uIvc74XWvBFdcCnG
 oo0q7uW5SPdcjAAoW081dGUtNRdieTBH3EuTOE7BKWaE+Rdaf3XOtGZKVmmD4StJKwHc
 KUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=93iMoC3KPx/x0Q6JGc5TcdEXDXQ5YXnOwP35BihAxIw=;
 b=KdkA+RYgGHX022pU280P3rywHknbe44dbLivDJ/9ImuTVKai7zmJMSSd2lC66rzN/+
 rRbIKVC6/yvmDfVPr+uXgOEXdIG0y+rvSD9RLGBxUEeKiWWt9FxKdIavVeCxvG+f85sV
 ZZiLD35VKCQszQY2rd+053MFlQi8cn66zEHQ7T+CQm/i8PIfi1ZGsH64LsnfeSq4uE3N
 mo/LnjQMAGy5xeWb0KU3xH2uwDgasQDXatQQgz/J4oyyDe7a163K8b0d7ZtwGRlr3ir3
 Bl/mVi5cI/Fi5znbKwsJxBMtBi6XwaM/PFUuh2TgmN8XoySYd+IMh5PDLyv745cIZZBK
 1N0Q==
X-Gm-Message-State: APzg51BiLxitsNNHdTUSMuE2cdXYf51HErCzmeWODw04neLe/EEdccJ8
 rgyAyefAPNXSZfzEbHfKXPGaVrvSGeuzXXKCuVoWCw==
X-Google-Smtp-Source: ANB0VdY6CDzl2hlGAp2Xmb7ZfuqEMFINukmTM5HEpwwN33iBWXoCgrByjcYpVqL8VeRns4g2nl6c7ubnIA4ZvqMiUIk=
X-Received: by 2002:a17:902:9a82:: with SMTP id
 w2-v6mr3983469plp.109.1536781915447; 
 Wed, 12 Sep 2018 12:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAO=notyNQDxqa_DZtfLJxO2NE04gqgpzZGi0Q_HHgCKkRDVSgw@mail.gmail.com>
 <6E182BAD-47B8-4290-8754-2DA4E843145F@fuzziesquirrel.com>
In-Reply-To: <6E182BAD-47B8-4290-8754-2DA4E843145F@fuzziesquirrel.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 12 Sep 2018 12:51:44 -0700
Message-ID: <CAO=notwQBph4z+VW22-V_pLfweMTv5tptQ07RP6ZxjdeBVY=oQ@mail.gmail.com>
Subject: Re: New Library SOP
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 12 Sep 2018 19:51:59 -0000

On Wed, Sep 12, 2018 at 11:24 AM Brad Bishop
<bradleyb@fuzziesquirrel.com> wrote:
>
>
>
> > On Sep 11, 2018, at 8:41 PM, Patrick Venture <venture@google.com> wrote=
:
> >
> > Brad;
> >
> > William contributed two libraries by building them as a repo under his
> > personal work account first, and then presumably you mirrored from
> > them.  Is this the process you prefer?  I'm looking to do some
> > cleanup-by-library and wanted to take off in the right direction.
>
> I don=E2=80=99t think I have a preferred process.  The one you have descr=
ibed should
> work fine.  Otherwise I can just create a new repo.  I suppose it is a bi=
t
> easier for people to leave feedback that way?

I agree that by forcing it through at least one round of gerrit people
have a chance to weigh in, which is preferable in my opinion.  And
goes along with the notion of upstream-first, which has something I've
been trying to push.
