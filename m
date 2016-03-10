Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A72D71A0007
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2016 14:10:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=zIJuuXEC; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=SPoCqSng; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id c129so4004180oif.3
 for <openbmc@lists.ozlabs.org>; Wed, 09 Mar 2016 19:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Y6pTJtCBEPzZV04t+7dTlqflOvc+AlJuuJGp0Uax0p0=;
 b=zIJuuXECKI+7NfWWTgko9xG9qAZASTebwq7g2hFaUsEuJrTf49vJ8iYrmDrpFrrZQW
 GOOrPa5iN0Q4wom68ZaWPmzCPhmZu1kM60eCvCPbS/dPf+oGzj3D6ihAu1t00+mSfheV
 Tz1D2UGIPst8hI+twj23fRrmnF67r/z/niAkPeoGttFvpXL6otFvmRuhmljhJLTTchLS
 eG8uN1brmqwglJ9WdZ7ulHhASMLXz6WicLxZ1AhZga5gWq2/2rYUQuxsOJV7BqTZ7JaA
 +Dty3HWVwhQgb6OfOaE4/hzAkp8NqVHcgIPH+Geycuo2Za7k85FPWC85j+GujzOJ1gNJ
 ri4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=Y6pTJtCBEPzZV04t+7dTlqflOvc+AlJuuJGp0Uax0p0=;
 b=SPoCqSngr8xkVt0t574HCMXGuzDUExETM6QS/zY4fA6jqEL0gExYmP40aanzX3Lvm6
 hfAfYfy45gfBwIFtm6v09po9U6Le9SM7LBo02L3T9gKMV3LDD6pfddFYa39ZNX/BAFk5
 yCZiTy8i+NrWSgB8HT6yypjoTjDcQ0KbLTnhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=Y6pTJtCBEPzZV04t+7dTlqflOvc+AlJuuJGp0Uax0p0=;
 b=gBqy67TdHK3wANCNninCQ8+ZvO2nHQvB62MuXrfykQmyjwJpqwTpXzyLvoIOpjooNR
 rISjWrD4orgsMQHhc2C3G1pW0smmIQp9r7r2KjsqZ9q21uweO26h4/sm166ZU3Dahe1r
 1DVslkv2Y/G/0GUedIUR9qmYEQpf+PdUEpPq0+Dwz/LzhfdgUDklAihA97ZND0mNouVx
 tOd5T11wbMRTZWPh+I2dPkeYOpDc3em0RoZ6TWuke4wVnjC66C+Dv0Ec5NfWDlhke/yu
 7u/Hr5t3HlxDVPm/dOdyFTQE2mXwU9wFpiu118c2u6Z4/DN8C+DAbrgIzbQUEkBun0EL
 NBXA==
X-Gm-Message-State: AD7BkJLfYa2ZM66+x3nVkOpKiI/jXQlvLyincg7Wb5J1AHPyXPrAX8AtlRXXrn63wJ1SIFZzSOHvW4Mlef7NUg==
X-Received: by 10.202.205.196 with SMTP id d187mr628655oig.119.1457579403419; 
 Wed, 09 Mar 2016 19:10:03 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.60.246.10 with HTTP; Wed, 9 Mar 2016 19:09:43 -0800 (PST)
In-Reply-To: <1457382644-3823-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457382644-3823-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457382644-3823-2-git-send-email-openbmc-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Mar 2016 13:39:43 +1030
X-Google-Sender-Auth: eql1e54HPNHaXpL59nt51tqXtA4
Message-ID: <CACPK8Xf5N7L5aGESUaJHbWH+e_Q=TRJP+s3oc1wyaPAX59O-_w@mail.gmail.com>
Subject: Re: [PATCH phosphor-event v3] Add association interface to each event
 log
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 chris austen <austenc@us.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Mar 2016 03:10:06 -0000

On Tue, Mar 8, 2016 at 7:00 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
>
> +static int prop_message_assoc(sd_bus *bus,
> +                       const char *path,
> +                       const char *interface,
> +                       const char *property,
> +                       sd_bus_message *reply,
> +                       void *userdata,
> +                       sd_bus_error *error)
> +{
> +       int r=0;
> +       messageEntry_t *m = (messageEntry_t*) userdata;

This is c, you don't need to cast a void * to your type.

> +       event_record_t *rec;
> +       char *p;
> +       char *token;
> +
> +       rec = message_record_open(m->em, m->logid);
> +       if (!rec) {
> +               fprintf(stderr,"Warning missing evnet log for %lx\n", m->logid);
> +               sd_bus_error_set(error,
> +                       SD_BUS_ERROR_FILE_NOT_FOUND,
> +                       "Could not find log file");
> +               return -1;
> +       }
> +
> +       p = rec->association;
> +
> +       token = strtok(p, " ");
> +       if (token) {
> +               r = sd_bus_message_open_container(reply, 'a', "(sss)");
> +               if (r < 0) {
> +                       fprintf(stderr,"Error opening container %s to reply %s\n", token, strerror(-r));

Do you need to exit here if the reply could not be opened?

> +               }
> +
> +               while(token) {
> +
> +                       r = sd_bus_message_append(reply, "(sss)", "fru", "event", token);
> +                       if (r < 0) {
> +                               fprintf(stderr,"Error adding properties for %s to reply %s\n", token, strerror(-r));
> +                       }
> +
> +                       token = strtok(NULL, " ");
> +               }
> +
> +               r = sd_bus_message_close_container(reply);
> +       }

Do you need to close the thing you opened with message_record_open?
> +
> +       return r;
> +}
>
>
