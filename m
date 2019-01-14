Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="I4IWMPD1"; 
 dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dW6w151xzDqQm
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 22:13:27 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id i7so26001688qtj.10
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 03:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=svBCDBq8bWr+JrQJ41SKoxjOcMNQ6G0zJyH5TfvUZqU=;
 b=I4IWMPD1UgIPQ60krEIXBmSSpQbIOL/hoYd704xzRq8Y5l3Y1B7CFABR3La3dEAh8N
 p4q+jEw6zxuYxl70NGCUNcyNpWhklR1JEZSrrGPUKY23YGXTb5yC5ZixT7vKFnNJhX2K
 NrE4sIzAy8Z41IER6MRmJfg6M33wf9rB96wTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=svBCDBq8bWr+JrQJ41SKoxjOcMNQ6G0zJyH5TfvUZqU=;
 b=r+iWIRdcAepAflwaLK0YCly/zzqntVRZLYj3Nj3DDrvTmYeT+fXxTB3RTQzE3USJDc
 q16CyardsAD9rRKWyV+8cPPtcTyCcPHLNSF0jVVdcxWE0J2XFWb2qevFjdRr5XSHpRzX
 8OqsMSpKE/WMxzeqDhXuKszuKlm4reUZfRIRGWDykEkPM/Wu/mW8+aWmBIROcGz/20pX
 jyZT9tJ4pgziNavne7xWu5NhBYs1yegl6CnQpOckAuMWlVHhLuS6wYPy6xtpSCdgykNB
 dTFtLEMbV6qu3qYZ9uoT64QuvNOOMOhYWhW0HiGhDmiCgyFnYjJmUcUkKCuu6rKT8+4G
 5/dw==
X-Gm-Message-State: AJcUukcd2HNTMZEyWBgpxEpGpS99OmaR9Di0y/urtvQ/sUw8+heXILU1
 nXqaR3wgB8YDdyyxolQyKkLr8M3P8JatEGJaVag=
X-Google-Smtp-Source: ALg8bN7S+uW7N8MNoCNnwO5M9a565avKw8p3W45E80SBpi6+wUmVUWG7NejFmM+CbxAyRKFfKPnEazyIy7Rr04MrWkM=
X-Received: by 2002:ac8:3065:: with SMTP id g34mr23873498qte.136.1547464405416; 
 Mon, 14 Jan 2019 03:13:25 -0800 (PST)
MIME-Version: 1.0
References: <20190107214136.5256-1-jae.hyun.yoo@linux.intel.com>
 <20190107214136.5256-4-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20190107214136.5256-4-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 14 Jan 2019 21:43:13 +1030
Message-ID: <CACPK8XfxU6r_0HLbD2MuSgON5-G43cpENhK+SR=9KhBG4GeWDA@mail.gmail.com>
Subject: Re: [PATCH v10 03/12] peci: Add support for PECI bus driver core
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Fengguang Wu <fengguang.wu@intel.com>, 
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Julia Cartwright <juliac@eso.teric.us>, 
 Haiyue Wang <haiyue.wang@linux.intel.com>,
 James Feist <james.feist@linux.intel.com>, 
 Vernon Mauery <vernon.mauery@linux.intel.com>
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
X-List-Received-Date: Mon, 14 Jan 2019 11:13:29 -0000

Hello Jae,

On Tue, 8 Jan 2019 at 08:11, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> This commit adds driver implementation for PECI bus core into linux
> driver framework.

I would like to help you get this merged next release cycle, as we are
now carrying it in OpenBMC. I suggest we ask Greg to queue it up if
there are no objections after you've addressed my questions.

> +static u8 peci_aw_fcs(u8 *data, int len)

I was wondering what aw_fcs meant. I notice that later on you describe
it as an Assure Write Frame Check Sequence byte. You could add a
comment next to this function :)

Instead of casing to u8 every time you call this, you could have this
take a struct peci_xfer_msg * and cast when calling crc8.

> +{
> +       return crc8(peci_crc8_table, data, (size_t)len, 0);
> +}
> +
> +static int __peci_xfer(struct peci_adapter *adapter, struct peci_xfer_msg *msg,
> +                      bool do_retry, bool has_aw_fcs)
> +{
> +       ktime_t start, end;
> +       s64 elapsed_ms;
> +       int rc = 0;
> +
> +       /**

These are for kerneldoc, and the comments aren't kerneldoc. Replace
them with /* instead.

> +        * For some commands, the PECI originator may need to retry a command if
> +        * the processor PECI client responds with a 0x8x completion code. In
> +        * each instance, the processor PECI client may have started the
> +        * operation but not completed it yet. When the 'retry' bit is set, the
> +        * PECI client will ignore a new request if it exactly matches a
> +        * previous valid request.
> +        */
> +
> +       if (do_retry)
> +               start = ktime_get();
> +
> +       do {
> +               rc = adapter->xfer(adapter, msg);
> +
> +               if (!do_retry || rc)
> +                       break;
> +
> +               if (msg->rx_buf[0] == DEV_PECI_CC_SUCCESS)
> +                       break;
> +
> +               /* Retry is needed when completion code is 0x8x */
> +               if ((msg->rx_buf[0] & DEV_PECI_CC_RETRY_CHECK_MASK) !=
> +                   DEV_PECI_CC_NEED_RETRY) {
> +                       rc = -EIO;
> +                       break;
> +               }
> +
> +               /* Set the retry bit to indicate a retry attempt */
> +               msg->tx_buf[1] |= DEV_PECI_RETRY_BIT;
> +
> +               /* Recalculate the AW FCS if it has one */
> +               if (has_aw_fcs)
> +                       msg->tx_buf[msg->tx_len - 1] = 0x80 ^

Can we guarantee that msg->tx_len will be set to non-zero whenever has_aw_fcs?

I suggest checking before doing the assignment in case a new caller is
added and they make a mistake.

> +static int peci_ioctl_get_dib(struct peci_adapter *adapter, void *vmsg)
> +{
> +       struct peci_get_dib_msg *umsg = vmsg;
> +       struct peci_xfer_msg msg;
> +       int rc;
> +
> +       msg.addr      = umsg->addr;
> +       msg.tx_len    = GET_DIB_WR_LEN;
> +       msg.rx_len    = GET_DIB_RD_LEN;
> +       msg.tx_buf[0] = GET_DIB_PECI_CMD;
> +
> +       rc = peci_xfer(adapter, &msg);

Most of tx_buf is going to be uninitialised. I assume a well behaving
adapter->xfer will check this and only send the correct number of
bytes, but it might pay to zero out struct peci_xfer_msg in all of
these functions?

> +       if (rc)
> +               return rc;
> +
> +       umsg->dib = le64_to_cpup((__le64 *)msg.rx_buf);
> +
> +       return 0;
> +}

> +
> +#if IS_ENABLED(CONFIG_OF)
> +static struct peci_client *peci_of_register_device(struct peci_adapter *adapter,
> +                                                  struct device_node *node)
> +{
> +       struct peci_board_info info = {};
> +       struct peci_client *result;
> +       const __be32 *addr_be;
> +       int len;
> +
> +       dev_dbg(&adapter->dev, "register %pOF\n", node);
> +
> +       if (of_modalias_node(node, info.type, sizeof(info.type)) < 0) {

I don't understand why you're doing this. Won't this always be peci,
as your binding requires?

> +               dev_err(&adapter->dev, "modalias failure on %pOF\n", node);
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       addr_be = of_get_property(node, "reg", &len);
> +       if (!addr_be || len < sizeof(*addr_be)) {

The second check looks suspicious.

You could fix it to check the expected length (4), or use of_property_read_u32.

> +               dev_err(&adapter->dev, "invalid reg on %pOF\n", node);
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       info.addr = be32_to_cpup(addr_be);
> +       info.of_node = of_node_get(node);
> +
> +       result = peci_new_device(adapter, &info);
> +       if (!result)

Should you do an of_node_put here?

> +               result = ERR_PTR(-EINVAL);
> +
> +       of_node_put(node);

Why do you release the reference here?

> +       return result;
> +}
> +
