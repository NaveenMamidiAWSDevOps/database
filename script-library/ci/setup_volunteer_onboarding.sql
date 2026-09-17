-- Setup for the disposable CI database only.
\set ON_ERROR_STOP on

-- Resolve the user ID sequence and unqualified trigger functions.
SET search_path TO virginia_dev_saayam_rdbms, public;

-- Supporting languages provides the shared set_updated_at() function.
\ir ../../ddl/Tables/ddl_supporting_languages.sql

-- Lookup tables required by users.
\ir ../../ddl/Tables/ddl_country.sql
\ir ../../ddl/Tables/ddl_state.sql
\ir ../../ddl/Tables/ddl_user_status.sql
\ir ../../ddl/Tables/ddl_user_category.sql

-- Users and skill categories.
\ir ../../ddl/Tables/ddl_users.sql
\ir ../../ddl/Tables/ddl_help_categories.sql

-- Applications defines updated_at_handler() for volunteer_details.
\ir ../../ddl/Tables/ddl_volunteer_applications.sql
\ir ../../ddl/Tables/ddl_volunteer_details.sql
\ir ../../ddl/Tables/ddl_user_skills.sql