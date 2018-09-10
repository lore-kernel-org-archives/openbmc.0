Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="P+KbWTHo"; 
 dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 428CrR3Q58zF3B0
 for <openbmc@lists.ozlabs.org>; Tue, 11 Sep 2018 02:17:59 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id b12-v6so9957791plr.8
 for <openbmc@lists.ozlabs.org>; Mon, 10 Sep 2018 09:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=HjjWmIG/FWFpgn12t7a+967rkHcZT4ppHdPe7BaG5a0=;
 b=P+KbWTHoTKc5GZ3jWQJa446phvLoQCQVciI/eX0/BjlBJ3I0aTQvzd3TLwoEe7Ijgv
 LRuNyCEg8h5O1T5Hj5lnV+sqVbn1B/GLeB9K4EWGIA4aW3DDmkGbCoL8t417xnqAOvwb
 7PokmPg5uKlVPm1ScvKefPlQTOdtPHLJhtuPoLq5PEm0deXycaAYhLmdaq97/SBCwk1u
 sS+cwwFN4O96g90dJXejRmPY6dR30n5PnsgRSG18dp/5gN8UJzKkCsL2cqPyB8rgWdhe
 PsAeCGVOBJ7pjjnjafgTmRt6boiQZIS0jjXYtuQ6EJSuz4Cz87WQYPmvQPA5ddJi/BRY
 RUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=HjjWmIG/FWFpgn12t7a+967rkHcZT4ppHdPe7BaG5a0=;
 b=btozVI+OfK5yE93pa4fe+L06a6crH7p9QVnKbmywBdN05f1YgyUcKjrbJT/cyLq2gY
 4jI2EKq2dg/+OLY/iVaWk4RVHT2tSu2KRsQXmCP4N/1wV5G9Ijl/yztxDHqc4352KB9/
 Jer4F1ds1J95h7MDlEs0gUhhYIRBfXi/oCbvDR8CCkDWmsz9LONXWX78nrzvw9O1lELn
 kGBJFi527DKL4usxQz0Ne+luTDZd6WFrmXJnVihzrdNDMmc7+/1flQm9Jie/rAxrVet5
 6TBMK3+LdOhJjPTe1x3G7MtKVSgLM1zHjlQtb4ZqKq5VdLa+5lDi1idRD3TtBfgkj4+Z
 mG7A==
X-Gm-Message-State: APzg51Cx7sogjtrnFANKgTOKCJXWoW9I31KqDNJqSJ+XvIVwU3k6nO9Q
 3XmFdcW+3HvpsIUwRpAzXakSH9T4xyJuMkTI5G7lUKTCYh8FEQ==
X-Google-Smtp-Source: ANB0VdY2lbRL7++jfO0h0rvtgp5fmEyJ6gzHEZeSdAcV3Asw0Bav4kC+GnBdOTp0T1qoFis5aIi3mUZMAqMER/UeuoY=
X-Received: by 2002:a17:902:b70f:: with SMTP id
 d15-v6mr23368515pls.53.1536596276569; 
 Mon, 10 Sep 2018 09:17:56 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Mon, 10 Sep 2018 09:17:45 -0700
Message-ID: <CAO=notz1BPmjSTmcLBKOs1Cv9FNqGCi5zYBw24jufDjXdPHR7g@mail.gmail.com>
Subject: is_method_error versus call() errors
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 10 Sep 2018 16:18:00 -0000

Given:

_public_ int sd_bus_message_is_method_error(sd_bus_message *m, const
char *name) {
        assert_return(m, -EINVAL);
        if (m->header->type != SD_BUS_MESSAGE_METHOD_ERROR)
                return 0;
        if (name && (!m->error.name || !streq(m->error.name, name)))
                return 0;
        return 1;
}

The failures from call() don't always set the reply (maybe don't ever,
but I didn't read it closely).  Which means, is_method_error() can
happen when the bus call itself was fine, so we need to check both IFF
we're going to read the response.

I'm working on eliminating the new crashes from phosphor-host-ipmid
and other repositories, now that sdbusplus can except, which is not
caught even though there's an error case for is_method_error()
immediately after the call.

In phosphor-pid-control, I dropped the is_method_error() check, but I
think it's still valid before trying to read() a message -- so I will
likely throw a patch adding that check.

Patrick
