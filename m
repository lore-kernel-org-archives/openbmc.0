Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="b1rVuaNc"; 
 dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42mngN2Sx1zF37D
 for <openbmc@lists.ozlabs.org>; Sat,  3 Nov 2018 03:33:03 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id f26-v6so1254723pfn.9
 for <openbmc@lists.ozlabs.org>; Fri, 02 Nov 2018 09:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Y4Y6BLtvPRWUzPpvkOOfolPZ/VbO07+IRhWyPZQYSIs=;
 b=b1rVuaNc5iXiYS+rN5YIWnhPGbPtuPM7Rx7b922oMK1x0gVH8I4VnBKU31O8Bqnhi7
 MHevlhiMjC16JxB9hxRo31Yk4GLjaaKFkz4JhVM1ZNxLfLXUnEBO3k1TMuk/1i+tdc6q
 0zzUC62HpfQDy4r9dM+ab3rNg0sVQWHKHTNXqQJ3b7J7C76oNz47XRLysF1NtY/0hsQl
 MgSeQpGg3EO0OM2O94TrfTDexm7VehnhKhWiULXd2LPYqybA+9fwdx9xfM/4CgXgzbx0
 mOaRgw62GNvbyMGJ9m6undNqhoNKC0y2jQV6/KGnOwtZ4EQPoE0Yg9hGB2u9ZlQvjRr9
 psgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Y4Y6BLtvPRWUzPpvkOOfolPZ/VbO07+IRhWyPZQYSIs=;
 b=mzh5INpU/kKQoJBfHMMEoPziLUVyPrTc6xSSPxPJGF2+smOrLdLytCTbU8xRstqe3a
 Jib9ditj0TI+BnF1gDQHGgx4jaZlTRnwA4mL4XkWAFEXOyb22YCxrVc0KKFknCbZIM0V
 yjZYnKcm/8dv1Ftj1P7MPqy+GH/lFrTTwM83RB6FZ6g5qFvvi0FsCr681y9eEnUgsIZU
 Ya0uH1Q7CJT+3qfB3CA6JY4m74jkBTxrX49CIolXoIY4WCpMo7Z80/AIssc/8xDVVPTr
 2lhrgyQkvI0KCtEX/Ec7EaaDWD+72RaY7K8v7DyUGTCrD49YXyPIj8x9/XnsQpaMA/cF
 uh/Q==
X-Gm-Message-State: AGRZ1gIauEZhGKHNtFduch7mcycPSle55wOx8p2AohoNsJ/oyYUTfV7L
 pqKHX9Q+xjlRZiIgFIPA+0fhf3gAfMgFNIZGgtMjq09BRc806w==
X-Google-Smtp-Source: AJdET5dljMtUlgqYbpkrp3jcQq4Qn2pSqNtS9TPkSXCRayHT+RuDKOJCN+MP7VQgmwyTZiJyP6zwhghff5O2+KizhRQ=
X-Received: by 2002:a63:4044:: with SMTP id n65mr5288207pga.90.1541176381658; 
 Fri, 02 Nov 2018 09:33:01 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 2 Nov 2018 09:32:50 -0700
Message-ID: <CAO=notzskWiKUC149VvN=E6AiALP+G_2mFwRad56jhOykFcLsg@mail.gmail.com>
Subject: Copy-by-value in sdbus++ generated objects
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 William Kennington <wak@google.com>, 
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
X-List-Received-Date: Fri, 02 Nov 2018 16:33:05 -0000

Most repos inherit from an auto-generated object.  Those objects pass
all parameters by value.  This is fine for many cases where they would
need to create a copy of it, but in the case where:

for instance:
https://github.com/openbmc/sdbusplus/blob/master/tools/sdbusplus/templates/property.mako.prototype.hpp.in#L69

The values match it's wasteful to copy.  It's also possible the cpp I
learned way back is different in how this behavior works, but I wanted
to check.  Because of the prevalence of this code, if there are lots
of updates that don't actually change the value, it could optimize
quite a bit at run-time.

It would require a lot of simultaneous fixes (or two different objects
generated, and transitioning everything).

Thoughts?

Patrick
