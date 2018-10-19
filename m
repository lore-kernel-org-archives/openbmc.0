Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UXGfMlCn"; 
 dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42cHB31JGlzF3c8
 for <openbmc@lists.ozlabs.org>; Sat, 20 Oct 2018 07:11:38 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id p5-v6so1398376plq.8
 for <openbmc@lists.ozlabs.org>; Fri, 19 Oct 2018 13:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5eXfc0noMAmih/lOgJwqDJYqJ3fw3X6ilCOgeZZkayg=;
 b=UXGfMlCngc/y0NsadLZOU8n0W59Pre4Wid1mU3G9CbdNRTbhw+UkpzaGh6NHSrSKRf
 cT6ThVhANT5ro6Abwj7GgzddiG2nDGeoL7JpM7Yjkn1MNc4U3WOJrWzDOULQxeXdSVyG
 MVHrkCSJTuldW4lkybIklA9KeGiBB7ZNcN13YQGOdb/eCKJuo2lINthwS4nnGU9Jcyu1
 9HegcGjJ1Wa23Q0FZXuyxPQCRoxn1hn4sM548kqnlWJSeOCC0QyFCYoCtUiZ8tLBcaIs
 /iP0gnwtzQ9y2W5xofA8AD/fBDeD7J1PVYWYGauoT2n84d+uWagoD1B+cupz+FbihFb1
 c8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5eXfc0noMAmih/lOgJwqDJYqJ3fw3X6ilCOgeZZkayg=;
 b=VvT3CHxkn9EqoJJhR+AKt4JLuWUzqFxSt5UMWO5e//ptMmZyKFNDad6YpuIZAX2CGp
 ga+dsLTcVYvuBT8Yr5Klr2DHqWfoNW0wdXjBPVsO6GG8HrEQUnJDmUCAo8EodbueGEj/
 70SY0Z6zIE1SyCdezBfwqmI5uwTIbrzs2jK7gQg4EJRTD6kYJcJ2gnD2OpIkaQZ3T9eS
 KEuZGueT5TOi4xUReXkF+P7fQ1J3co9w9gtfzeJScT9lgaDC3uEGxncCUUrIly+tcN3d
 lM8oi5VqNv3WgNAdzOeVwc0XC4wc8OSFu0VLOtAs3F8ekr+QpAFDRC5oz83b3Iqz0PjF
 ujbw==
X-Gm-Message-State: ABuFfoi0GTM0h7076qSLvDCeDTnF0iqps3kJYALEFI/imq+bzf0lfmCs
 DlMcY600t6TM8w4dh5nWwcyWQFQsSCvUn8Y4Vo/zX2cH
X-Google-Smtp-Source: ACcGV62aT+VQURfUR1nOzg0qRkRxv+vVh33W0hy1zS0B6saK1iigoI562b86RoEqsbeIwltrA0ASGEF3es5bg6yxQHI=
X-Received: by 2002:a17:902:124:: with SMTP id
 33-v6mr36016182plb.205.1539979895820; 
 Fri, 19 Oct 2018 13:11:35 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 19 Oct 2018 13:10:42 -0700
Message-ID: <CAO=notwq+f-UvPhFzEPDgdi710KcV0aoHiEQOcWK_9QFhs_vJw@mail.gmail.com>
Subject: Firmware Update over Blobs
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 19 Oct 2018 20:11:40 -0000

I'm sending out this design as a gerrit review against /docs later
today.  This email is really only making sure I actually send it today
and don't end up putting it off :D :D

Patrick
