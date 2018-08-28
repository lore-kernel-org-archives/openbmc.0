Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Av3bZeyA"; 
 dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420DV972MxzDr5Y
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 02:19:28 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id e11-v6so948134plb.3
 for <openbmc@lists.ozlabs.org>; Tue, 28 Aug 2018 09:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=6J1McmOp2Y8OAJ/uo7K5VWcWpZOYFqHply+OsRkKyow=;
 b=Av3bZeyAgwuJwsEyW6Qb3zokEwSOSwrHkUhvTBs2IhMAAW7pnwHjND6P7J7ACrqVGh
 e6xvC6oaPbKnBjG406WGFlG5wwdLSDBYgkosNynNWvFflBXDwoCwxcf4Vh6IXfattLMD
 r78gPwjinqCnJjrr+9pG1p6NratGS8DcLY1Q2MVeyut0c9Mff2rtxFyxdD6kJJnKDFM0
 3+VjN1gwUqIXF6Gz2pm25O5V1xd79oJ6OikdnlkRx+5pxSKGCUOSQF24SlckiDStjCuj
 JWb97Pok3SjYCFR5IR0G3ScFgCoiP++5q+oW9jBwB7PMhCfoubyaYI302PqcP+1b6Mm/
 veAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=6J1McmOp2Y8OAJ/uo7K5VWcWpZOYFqHply+OsRkKyow=;
 b=oZldGA3WSVdjWV6+mpKNbaSw8Rb14upsBacg1taqqehRUkP/OMrph6lr74504BUm7U
 7VTWlsYGStLL1Hf1pHd8TLWY9tNb6cDPRSWZdHYApV02vPYPvzsHG9HjO9WlTFJIVPRt
 pYHWipUEVbfJLxiprzJrhYLRD1noAfNvxBdtaYEFIcEqIxpIbYrPInvGugJcogz+wMxh
 Dtmw2sHNU5VQI9bvnvt0FAPgpIMgW/xD2Y/WoAQpd+4KdBmPDGTnx4FWibQCAupvXdwA
 QWM9fk7fvxc/hu1cdAAJb1/QnRvxyk8LYLQYzX29g+4MyrX0Q1amgAFMxXWWVQixceJv
 F6Hg==
X-Gm-Message-State: APzg51D8ggQU7dHCAPUG6qLSUY/XdejsvOcoaCWlv8UKzX4o8kuxsb4c
 PmPTV44OY31eDUzmq/d4mGLjesGyZPdkzFHLYiJYQw==
X-Google-Smtp-Source: ANB0VdaxhTF/WTppkE2kdMgiOJDm/xEacGKNykd1wHb2HxrUfLedjdV0d9eYPwtpX1Kbmn6bZ8kk+3jJsQaES7+yndg=
X-Received: by 2002:a17:902:46a4:: with SMTP id
 p33-v6mr2238616pld.205.1535473166578; 
 Tue, 28 Aug 2018 09:19:26 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Tue, 28 Aug 2018 09:19:14 -0700
Message-ID: <CAO=notyOhkCDeTOJ57edK8z61_6HKDtWahahx-U_fk8JukBctw@mail.gmail.com>
Subject: meta-google subtree repo
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Nancy Yuen <yuenn@google.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Tue, 28 Aug 2018 16:19:31 -0000

Brad,

I'm looking to send some more OEM IPMI code upstream, and since we're
using subtrees, perhaps it makes sense to have their recipes live
under meta-google under openbmc/openbmc instead of meta-phosphor.

If you think sure, then please create a meta-google layer repository.

Patrick
