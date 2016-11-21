Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMgBH3Z4QzDvjR
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 18:25:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JYQvC/Cx"; 
 dkim-atps=neutral
Received: by mail-oi0-x242.google.com with SMTP id f201so17131558oib.0
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 23:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=IiURBNIYc6kkx5tNSLzAjaef3IWMa47u8tnJ6XoyF8g=;
 b=JYQvC/CxAPOaPGvoJmMaRtNqA1wyYhzf3mSkbWEzvXzyE5sjTkTFMfDpXkrTu/l+79
 Kiy4vWg3AfVVV2XhPeJ8QR7tphoPlLHJm4VDPY7IBoJrngKNKi/vuv/jO34l2aQT8Xe3
 1FjnkSuN/9mRpc9MsUANe2USt5A1IrtgT35fBVJ1Xg/1FD3XunGVIdtDv/bYFY4ByH/q
 rZRN9oAOwc00yP0K456XMc8ip/DxGXdMTw+NJqVQDmWR6G8vKq4UD9m7TMdc0svKF2xn
 1C0eCoXJ9e3NOW7DwVNzgy0HzTtGKEeqOLBhk+g6cl7Ho/8pmgracByhJAePyHBKakny
 tiaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=IiURBNIYc6kkx5tNSLzAjaef3IWMa47u8tnJ6XoyF8g=;
 b=L9uDhGDik7oMMKooD2fNDf837hHcr7IePUm70D+WhnnZ1ImMm7zS+lGcigsrU+WCP9
 DH6hMojEtBzzsHhN8VN1assfeqyN/Xg/qiueRypQF9C2YmG05fYJBEZ5pw+RxfXe4NH+
 rL75UG6k/Rh3ewb20I6c77Jiqh1yLmyCHE2UCQGKpbYPVWaoZGlfwKlO906OVryfydBl
 /1jCoQyzE9ETuN1IBinl4Nt4sBX/NC7jppV1PFANDXOj7FvWHZ9+OLtGVXjLCBk6dEXo
 jAWkWpFzMDVlp/nkNBwMGECldfUt4fWphK9jjGHSmf0rrIspMgWFxbLBliY1rxW30qiU
 yLYQ==
X-Gm-Message-State: AKaTC0293o29PFYCZ045KtDnwbrxrjWCATu4dkqGJ5ryUh7506vt+HLXk+z16yzMDMRGIDVs/MFpsn/NWjZRQQ==
X-Received: by 10.202.78.140 with SMTP id c134mr7048218oib.198.1479713157725; 
 Sun, 20 Nov 2016 23:25:57 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 23:25:37 -0800 (PST)
In-Reply-To: <1479478938-13267-17-git-send-email-clg@kaod.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-17-git-send-email-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 17:55:37 +1030
X-Google-Sender-Auth: zR_VF1VMg2qx17fsICY5O1o0LU8
Message-ID: <CACPK8XfaMip0663pbcnMAKDHKOh-3zYwA4GcPe+iBdr6gjCQ+Q@mail.gmail.com>
Subject: Re: [PATCH qemu 16/38] aspeed/smc: add tests for Command mode
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Nov 2016 07:26:00 -0000

On Sat, Nov 19, 2016 at 12:51 AM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
> 0005 tests add a read_page_mem test

This looks like something went wrong

>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  tests/m25p80-test.c | 86 +++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 86 insertions(+)
>
> diff --git a/tests/m25p80-test.c b/tests/m25p80-test.c
> index cb7ec81f1a6d..3d449bd194a9 100644
> --- a/tests/m25p80-test.c
> +++ b/tests/m25p80-test.c
> @@ -36,6 +36,9 @@
>  #define   CRTL_EXTENDED0       0  /* 32 bit addressing for SPI */
>  #define R_CTRL0             0x10
>  #define   CTRL_CE_STOP_ACTIVE  (1 << 2)
> +#define   CTRL_READMODE        0x0
> +#define   CTRL_FREADMODE       0x1
> +#define   CTRL_WRITEMODE       0x2
>  #define   CTRL_USERMODE        0x3
>
>  #define ASPEED_FMC_BASE    0x1E620000
> @@ -76,6 +79,22 @@ static void spi_conf(uint32_t value)
>      writel(ASPEED_FMC_BASE + R_CONF, conf);
>  }
>
> +static void spi_ce_ctrl(uint32_t value)
> +{
> +    uint32_t conf =3D readl(ASPEED_FMC_BASE + R_CE_CTRL);
> +
> +    conf |=3D value;
> +    writel(ASPEED_FMC_BASE + R_CE_CTRL, conf);
> +}
> +
> +static void spi_ctrl_setmode(uint8_t mode, uint8_t cmd)
> +{
> +    uint32_t ctrl =3D readl(ASPEED_FMC_BASE + R_CTRL0);
> +    ctrl &=3D ~(CTRL_USERMODE | 0xff << 16);
> +    ctrl |=3D mode | (cmd << 16);
> +    writel(ASPEED_FMC_BASE + R_CTRL0, ctrl);
> +}
> +
>  static void spi_ctrl_start_user(void)
>  {
>      uint32_t ctrl =3D readl(ASPEED_FMC_BASE + R_CTRL0);
> @@ -128,6 +147,18 @@ static void read_page(uint32_t addr, uint32_t *page)
>      spi_ctrl_stop_user();
>  }
>
> +static void read_page_mem(uint32_t addr, uint32_t *page)
> +{
> +    int i;
> +
> +    /* move out USER mode to use direct reads from the AHB bus */
> +    spi_ctrl_setmode(CTRL_READMODE, READ);
> +
> +    for (i =3D 0; i < PAGE_SIZE / 4; i++) {
> +        page[i] =3D make_be32(readl(ASPEED_FLASH_BASE + addr + i * 4));
> +    }
> +}
> +
>  static void test_erase_sector(void)
>  {
>      uint32_t some_page_addr =3D 0x600 * PAGE_SIZE;
> @@ -195,6 +226,7 @@ static void test_write_page(void)
>
>      spi_ctrl_start_user();
>      writeb(ASPEED_FLASH_BASE, EN_4BYTE_ADDR);
> +    writeb(ASPEED_FLASH_BASE, WREN);
>      writeb(ASPEED_FLASH_BASE, PP);
>      writel(ASPEED_FLASH_BASE, make_be32(my_page_addr));
>
> @@ -217,6 +249,58 @@ static void test_write_page(void)
>      }
>  }
>
> +static void test_read_page_mem(void)
> +{
> +    uint32_t my_page_addr =3D 0x14000 * PAGE_SIZE; /* beyond 16MB */
> +    uint32_t some_page_addr =3D 0x15000 * PAGE_SIZE;
> +    uint32_t page[PAGE_SIZE / 4];
> +    int i;
> +
> +    /* Enable 4BYTE mode for flash. This is should be strapped by HW
> +     * for CE0 anyhow.
> +     */
> +    spi_ce_ctrl(1 << CRTL_EXTENDED0);
> +
> +    /* Check what was written */
> +    read_page_mem(my_page_addr, page);
> +    for (i =3D 0; i < PAGE_SIZE / 4; i++) {
> +        g_assert_cmphex(page[i], =3D=3D, my_page_addr + i * 4);
> +    }
> +
> +    /* Check some other page. It should be full of 0xff */
> +    read_page_mem(some_page_addr, page);
> +    for (i =3D 0; i < PAGE_SIZE / 4; i++) {
> +        g_assert_cmphex(page[i], =3D=3D, 0xffffffff);
> +    }
> +}
> +
> +static void test_write_page_mem(void)
> +{
> +    uint32_t my_page_addr =3D 0x15000 * PAGE_SIZE;
> +    uint32_t page[PAGE_SIZE / 4];
> +    int i;
> +
> +    /* Enable 4BYTE mode for flash. This is should be strapped by HW
> +     * for CE0 anyhow.
> +     */
> +    spi_ce_ctrl(1 << CRTL_EXTENDED0);
> +
> +    /* move out USER mode to use direct writes to the AHB bus */
> +    spi_ctrl_setmode(CTRL_WRITEMODE, PP);
> +
> +    for (i =3D 0; i < PAGE_SIZE / 4; i++) {
> +        writel(ASPEED_FLASH_BASE + my_page_addr + i * 4,
> +               make_be32(my_page_addr + i * 4));
> +    }
> +
> +    /* Check what was written */
> +    read_page_mem(my_page_addr, page);
> +    for (i =3D 0; i < PAGE_SIZE / 4; i++) {
> +        g_assert_cmphex(page[i], =3D=3D, my_page_addr + i * 4);
> +    }
> +}
> +
> +
>  static char tmp_path[] =3D "/tmp/qtest.m25p80.XXXXXX";
>
>  int main(int argc, char **argv)
> @@ -242,6 +326,8 @@ int main(int argc, char **argv)
>      qtest_add_func("/m25p80/erase_sector", test_erase_sector);
>      qtest_add_func("/m25p80/erase_all",  test_erase_all);
>      qtest_add_func("/m25p80/write_page", test_write_page);
> +    qtest_add_func("/m25p80/read_page_mem", test_read_page_mem);
> +    qtest_add_func("/m25p80/write_page_mem", test_write_page_mem);
>
>      ret =3D g_test_run();
>
> --
> 2.7.4
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
