Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="iMVZdNew"; 
 dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42X0Rx166YzF3LT
 for <openbmc@lists.ozlabs.org>; Sat, 13 Oct 2018 07:53:48 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id v133-v6so6374963pgb.2
 for <openbmc@lists.ozlabs.org>; Fri, 12 Oct 2018 13:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=2yDS3WKGNKQ0R7Gvd7kG3qM6E/1cyB5ng9QWU37Xvv8=;
 b=iMVZdNewGq1X3ky45wSAh1/SJQSU0J8vWaaffQaDBXwG5Ohy4UHAbID0VqbHYeotUZ
 HGMtqrfALOivEIMXZ/ZZFK60qr86Q8vilYbPwAPDH3wckNrwyhmgt6qu6wa8STXqK2xM
 EOWTLzM3MtKrmDpxj3dyHVjmyuYv/fdWbh/8EQqPoaqflFMxWj0MFCQ1Ljms+0xkJvL9
 Sir+J3KT8wLO/EUz14GXJ7w4QD0xHswQitSQoV0iMZ8p5AY0RXXOENEWMy0rO+R8izo5
 ajBCGyAv5VddecdmyaoxOFGbaXIaQfpGcSqcltV03kQFhAVzSgb9k0RSToRL6OF+pr9V
 1Tfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=2yDS3WKGNKQ0R7Gvd7kG3qM6E/1cyB5ng9QWU37Xvv8=;
 b=lT6zjXXAOvIf4DEvJxbrcpL2GJQvqF46PlSKcROXU7+wl23A/YbKHcKikgrlyldsUy
 uGGQHPDoX7jNcor+3LVjcxxui4DZNkvwN0RiR72x3MotTLU6iGl/Di62CzlVZL+BhTyO
 zS5zVaudDIPil+WnwA4s9Z4PLmxwXrzhktX3OsWjQuscos63WeKWcVLCuBL5TGOOh0eN
 TcKiqmfQwrDlVlcztBgNxn7gvnFGlN8w1F134fJqLP4WtBuplGsGWcaCK+sjW4wbpk+y
 fLVdFc9yVNSD6JhYT/tVBrmhBZBFTL89Pa+zE4n35SUCaD/ltpYU7fwdv2ypy1VDb8EJ
 /jYg==
X-Gm-Message-State: ABuFfohl9O7Uu7Bcm7IloXRuFEOTQTQdchJTgQqrT0jpPXOXE4dj/5Ii
 YnlgSurIuqnP1nx7WtsF9b4FkrxLWoKlBHuX+HqVudEo
X-Google-Smtp-Source: ACcGV62LcHF7qNbTCgGZwcvBuKz/me8HfkhkTyciIYahWY67aUgFDcQN2KTc0HbKIf6xfqb2ebQ3y3K0MRHxMLu00K4=
X-Received: by 2002:a63:a42:: with SMTP id z2-v6mr6762306pgk.209.1539377625767; 
 Fri, 12 Oct 2018 13:53:45 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 12 Oct 2018 13:53:34 -0700
Message-ID: <CAO=notz_KizBdONsKjtQ6U05r4hWQOuxa_cx9Cshps7V8=PRbw@mail.gmail.com>
Subject: Notion of Flakiness in Sensor Readings
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>, 
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 12 Oct 2018 20:53:50 -0000

Currently, there are a few approaches in phosphor-hwmon on how to
handle sensors being present sometimes, or flaky on reads.  We've
talked in the past about how to handle a read failure that should be
ignored.  A real failure that is flaky or temporary.

I was thinking of just adding a property to the Sensor.Value interface
to report information.  Basically, someone reading the value needs to
know if it's valid.  The idea of a range check for validity doesn't
work as cleanly for this specific purpose, in my opinion.  The min/max
can be used cleanly to determine the linearization though!

I was thinking perhaps a boolean, that you can check to see if the
value should be used or trusted.  Then, I thought, perhaps, a enum
with a series of states, starting with the states of "Valid',
"Invalid."  Not being able to think of a third state, I fell back onto
a boolean.

Thoughts?

Patrick
