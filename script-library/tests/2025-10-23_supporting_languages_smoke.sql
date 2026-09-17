-- Smoke test for the isolated CI database.
DO $$
DECLARE
    active_count INTEGER;
    rtl_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO active_count
    FROM virginia_dev_saayam_rdbms.supporting_languages
    WHERE is_active = TRUE;

    IF active_count <> 13 THEN
        RAISE EXCEPTION 'Expected 13 active languages, found %',
            active_count;
    END IF;

    IF EXISTS (
        SELECT 1
        FROM virginia_dev_saayam_rdbms.supporting_languages
        GROUP BY iso_639_1_code, locale_code
        HAVING COUNT(*) > 1
    ) THEN
        RAISE EXCEPTION 'Duplicate language/locale pairs found';
    END IF;

    SELECT COUNT(*) INTO rtl_count
    FROM virginia_dev_saayam_rdbms.supporting_languages
    WHERE writing_direction = 'RTL';

    IF rtl_count <> 2 THEN
        RAISE EXCEPTION 'Expected 2 RTL languages, found %',
            rtl_count;
    END IF;

    RAISE NOTICE 'PASS: All supporting language checks passed';
END;
$$;